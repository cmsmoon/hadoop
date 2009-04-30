#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#
require 5.6.0;
use strict;
use warnings;
use Thrift;

use Hadoop::API::Types;

# HELPER FUNCTIONS AND STRUCTURES

package Hadoop::API::Datanode_readBlock_args;
use Class::Accessor;
use base('Class::Accessor');
Hadoop::API::Datanode_readBlock_args->mk_accessors( qw( block offset length ) );
sub new {
my $classname = shift;
my $self      = {};
my $vals      = shift || {};
$self->{block} = undef;
$self->{offset} = undef;
$self->{length} = undef;
if (UNIVERSAL::isa($vals,'HASH')) {
if (defined $vals->{block}) {
  $self->{block} = $vals->{block};
}
if (defined $vals->{offset}) {
  $self->{offset} = $vals->{offset};
}
if (defined $vals->{length}) {
  $self->{length} = $vals->{length};
}
}
return bless($self,$classname);
}

sub getName {
  return 'Datanode_readBlock_args';
}

sub read {
my $self  = shift;
my $input = shift;
my $xfer  = 0;
my $fname;
my $ftype = 0;
my $fid   = 0;
$xfer += $input->readStructBegin(\$fname);
while (1) 
{
$xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
if ($ftype == TType::STOP) {
last;
}
SWITCH: for($fid)
{
/^1$/ && do{if ($ftype == TType::STRUCT) {
$self->{block} = new Hadoop::API::Block();
$xfer += $self->{block}->read($input);
} else {
  $xfer += $input->skip($ftype);
}
last; };
/^2$/ && do{if ($ftype == TType::I64) {
$xfer += $input->readI64(\$self->{offset});
} else {
  $xfer += $input->skip($ftype);
}
last; };
/^3$/ && do{if ($ftype == TType::I32) {
$xfer += $input->readI32(\$self->{length});
} else {
  $xfer += $input->skip($ftype);
}
last; };
  $xfer += $input->skip($ftype);
}
$xfer += $input->readFieldEnd();
}
$xfer += $input->readStructEnd();
return $xfer;
}

sub write {
my $self   = shift;
my $output = shift;
my $xfer   = 0;
$xfer += $output->writeStructBegin('Datanode_readBlock_args');
if (defined $self->{block}) {
$xfer += $output->writeFieldBegin('block', TType::STRUCT, 1);
$xfer += $self->{block}->write($output);
$xfer += $output->writeFieldEnd();
}
if (defined $self->{offset}) {
$xfer += $output->writeFieldBegin('offset', TType::I64, 2);
$xfer += $output->writeI64($self->{offset});
$xfer += $output->writeFieldEnd();
}
if (defined $self->{length}) {
$xfer += $output->writeFieldBegin('length', TType::I32, 3);
$xfer += $output->writeI32($self->{length});
$xfer += $output->writeFieldEnd();
}
$xfer += $output->writeFieldStop();
$xfer += $output->writeStructEnd();
return $xfer;
}

package Hadoop::API::Datanode_readBlock_result;
use Class::Accessor;
use base('Class::Accessor');
Hadoop::API::Datanode_readBlock_result->mk_accessors( qw( success ) );
sub new {
my $classname = shift;
my $self      = {};
my $vals      = shift || {};
$self->{success} = undef;
$self->{err} = undef;
if (UNIVERSAL::isa($vals,'HASH')) {
if (defined $vals->{success}) {
  $self->{success} = $vals->{success};
}
if (defined $vals->{err}) {
  $self->{err} = $vals->{err};
}
}
return bless($self,$classname);
}

sub getName {
  return 'Datanode_readBlock_result';
}

sub read {
my $self  = shift;
my $input = shift;
my $xfer  = 0;
my $fname;
my $ftype = 0;
my $fid   = 0;
$xfer += $input->readStructBegin(\$fname);
while (1) 
{
$xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
if ($ftype == TType::STOP) {
last;
}
SWITCH: for($fid)
{
/^0$/ && do{if ($ftype == TType::STRUCT) {
$self->{success} = new Hadoop::API::BlockData();
$xfer += $self->{success}->read($input);
} else {
  $xfer += $input->skip($ftype);
}
last; };
/^1$/ && do{if ($ftype == TType::STRUCT) {
$self->{err} = new Hadoop::API::IOException();
$xfer += $self->{err}->read($input);
} else {
  $xfer += $input->skip($ftype);
}
last; };
  $xfer += $input->skip($ftype);
}
$xfer += $input->readFieldEnd();
}
$xfer += $input->readStructEnd();
return $xfer;
}

sub write {
my $self   = shift;
my $output = shift;
my $xfer   = 0;
$xfer += $output->writeStructBegin('Datanode_readBlock_result');
if (defined $self->{success}) {
$xfer += $output->writeFieldBegin('success', TType::STRUCT, 0);
$xfer += $self->{success}->write($output);
$xfer += $output->writeFieldEnd();
}
if (defined $self->{err}) {
$xfer += $output->writeFieldBegin('err', TType::STRUCT, 1);
$xfer += $self->{err}->write($output);
$xfer += $output->writeFieldEnd();
}
$xfer += $output->writeFieldStop();
$xfer += $output->writeStructEnd();
return $xfer;
}

package Hadoop::API::DatanodeIf;

sub readBlock{
  my $self = shift;
  my $block = shift;
  my $offset = shift;
  my $length = shift;

  die 'implement interface';
}
package Hadoop::API::DatanodeRest;

sub new {
my $classname=shift;
my $impl     =shift;
my $self     ={ impl => $impl };

return bless($self,$classname);
}

sub readBlock{
my $self = shift;
my $request = shift;

my $block = ($request->{'block'}) ? $request->{'block'} : undef;
my $offset = ($request->{'offset'}) ? $request->{'offset'} : undef;
my $length = ($request->{'length'}) ? $request->{'length'} : undef;
return $self->{impl}->readBlock($block, $offset, $length);
}

package Hadoop::API::DatanodeClient;

use base('Hadoop::API::DatanodeIf');
sub new {
my $classname = shift;
my $input     = shift;
my $output    = shift;
my $self      = {};
  $self->{input}  = $input;
  $self->{output} = defined $output ? $output : $input;
  $self->{seqid}  = 0;
return bless($self,$classname);
}

sub readBlock{
  my $self = shift;
  my $block = shift;
  my $offset = shift;
  my $length = shift;

$self->send_readBlock($block, $offset, $length);
return $self->recv_readBlock();
}

sub send_readBlock{
  my $self = shift;
  my $block = shift;
  my $offset = shift;
  my $length = shift;

$self->{output}->writeMessageBegin('readBlock', TMessageType::CALL, $self->{seqid});
my $args = new Hadoop::API::Datanode_readBlock_args();
$args->{block} = $block;
$args->{offset} = $offset;
$args->{length} = $length;
$args->write($self->{output});
$self->{output}->writeMessageEnd();
$self->{output}->getTransport()->flush();
}

sub recv_readBlock{
  my $self = shift;

my $rseqid = 0;
my $fname;
my $mtype = 0;

$self->{input}->readMessageBegin(\$fname, \$mtype, \$rseqid);
if ($mtype == TMessageType::EXCEPTION) {
  my $x = new TApplicationException();
  $x->read($self->{input});
  $self->{input}->readMessageEnd();
  die $x;
}
my $result = new Hadoop::API::Datanode_readBlock_result();
$result->read($self->{input});
$self->{input}->readMessageEnd();

if (defined $result->{success} ) {
  return $result->{success};
}
if (defined $result->{err}) {
  die $result->{err};
}
die "readBlock failed: unknown result";
}
package Hadoop::API::DatanodeProcessor;

sub new {
my $classname = shift;
my $handler   = shift;
my $self      = {};
$self->{handler} = $handler;
return bless($self,$classname);
}

sub process {
my $self   = shift;
my $input  = shift;
my $output = shift;
my $rseqid = 0;
my $fname  = undef;
my $mtype  = 0;

$input->readMessageBegin(\$fname, \$mtype, \$rseqid);
my $methodname = 'process_'.$fname;
if (!method_exists($self, $methodname)) {
  $input->skip(TType::STRUCT);
  $input->readMessageEnd();
  my $x = new TApplicationException('Function '.$fname.' not implemented.', TApplicationException::UNKNOWN_METHOD);
  $output->writeMessageBegin($fname, TMessageType::EXCEPTION, $rseqid);
  $x->write($output);
  $output->writeMessageEnd();
  $output->getTransport()->flush();
  return;
}
$self->$methodname($rseqid, $input, $output);
return 1;
}

sub process_readBlock{
my $self = shift;
my ($seqid, $input, $output); 
my $args = new Hadoop::API::Datanode_readBlock_args();
$args->read($input);
$input->readMessageEnd();
my $result = new Hadoop::API::Datanode_readBlock_result();
eval {
$result->{success} = $self->{handler}->readBlock($args->block, $args->offset, $args->length);
}; if( UNIVERSAL::isa($@,'IOException') ){ 
$result->{err} = $@;
}
$output->writeMessageBegin('readBlock', TMessageType::REPLY, $seqid);
$result->write($output);
$output->getTransport()->flush();
}
1;