Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AD4C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:44:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLd0I-0000jH-7P; Fri, 05 Jan 2024 00:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rLd0G-0000iw-Iz; Fri, 05 Jan 2024 00:44:20 -0500
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rLd0E-0001Lv-0u; Fri, 05 Jan 2024 00:44:20 -0500
Received: from [192.168.123.94] (ip-178-202-040-247.um47.pools.vodafone-ip.de
 [178.202.40.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 5F899413B3; 
 Fri,  5 Jan 2024 05:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1704433453;
 bh=OyQM+TWjGJ6u5HqzmvRQlHPmDy8aSFTrKgSPYbJ15rU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Zo6ysmT/T3LBnJPOiNufXFNDjQje9Uhz8JtdjNAbA8O/zqCzczpHuL2LzyM+pb2f4
 /Cef4B1sSqPbWxja1E52ODSVH9c+CozB3eBgyPZNocCqbO8XTAheovWjJWqGDzZC41
 Meqf1GrErAEEDDA9e8sq59aE/W1VhVB+39+TglbuSxug5nS8wFxFvBKX5gGDsvyv5q
 BPYdxC349jK+uQPeTMJYEOBja/q6q2oaWE/LfeZEFtvTvQ6Fe+3Ozvkrf0CWnYTB45
 ZY2JaRjqIyuvMnNL3o27JHa12yYPmwMqBXL8xXwaNWgo3OlOdrQZlJP3278V+/lugA
 zxz0IRXZjWAfg==
Message-ID: <cf9b3023-d6d4-4da9-ab1e-da440f98bf3e@canonical.com>
Date: Fri, 5 Jan 2024 06:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] smbios: add processor-family option
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-2-heinrich.schuchardt@canonical.com>
 <CAKmqyKNmyMKMDuUwrgi4RQnAAWAJ7uSzMztDnHW+HRaM1zPNDA@mail.gmail.com>
Content-Language: en-US, de-DE
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAKmqyKNmyMKMDuUwrgi4RQnAAWAJ7uSzMztDnHW+HRaM1zPNDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.120;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-canonical-0.canonical.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.691,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 1/5/24 06:24, Alistair Francis wrote:
> On Fri, Dec 29, 2023 at 10:48 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> For RISC-V the SMBIOS standard requires specific values of the processor
>> family value depending on the bitness of the CPU.
> 
> Can you provide some details of where this is described? I can't seem to find it
> 
> Alistair

System Management BIOS (SMBIOS) Reference Specification 3.7.0 (DSP0134)
https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.7.0.pdf
7.5.2 Processor Information — Processor Family
Table 23 – Processor Information: Processor Family field

200h 512 RISC-V RV32
201h 513 RISC-V RV64
202h 514 RISC-V RV128

While for other architectures values for different CPU generations have 
been defined the values for RISC-V only depend on the bitness.

Best regards

Heinrich

> 
>>
>> Add a processor-family option for SMBIOS table 4.
>>
>> The value of processor-family may exceed 255 and therefore must be provided
>> in the Processor Family 2 field. Set the Processor Family field to 0xFE
>> which signals that the Processor Family 2 is used.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>> v2:
>>          new patch
>> ---
>>   hw/smbios/smbios.c | 13 +++++++++++--
>>   qemu-options.hx    |  4 ++--
>>   2 files changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
>> index 2a90601ac5..647bc6d603 100644
>> --- a/hw/smbios/smbios.c
>> +++ b/hw/smbios/smbios.c
>> @@ -102,6 +102,7 @@ static struct {
>>   #define DEFAULT_CPU_SPEED 2000
>>
>>   static struct {
>> +    uint16_t processor_family;
>>       const char *sock_pfx, *manufacturer, *version, *serial, *asset, *part;
>>       uint64_t max_speed;
>>       uint64_t current_speed;
>> @@ -110,6 +111,7 @@ static struct {
>>       .max_speed = DEFAULT_CPU_SPEED,
>>       .current_speed = DEFAULT_CPU_SPEED,
>>       .processor_id = 0,
>> +    .processor_family = 0x01, /* Other */
>>   };
>>
>>   struct type8_instance {
>> @@ -337,6 +339,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
>>           .name = "part",
>>           .type = QEMU_OPT_STRING,
>>           .help = "part number",
>> +    }, {
>> +        .name = "processor-family",
>> +        .type = QEMU_OPT_NUMBER,
>> +        .help = "processor family",
>>       }, {
>>           .name = "processor-id",
>>           .type = QEMU_OPT_NUMBER,
>> @@ -726,7 +732,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>>       snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, instance);
>>       SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
>>       t->processor_type = 0x03; /* CPU */
>> -    t->processor_family = 0x01; /* Other */
>> +    t->processor_family = 0xfe; /* use Processor Family 2 field */
>>       SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufacturer);
>>       if (type4.processor_id == 0) {
>>           t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
>> @@ -758,7 +764,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>>       t->thread_count = (threads_per_socket > 255) ? 0xFF : threads_per_socket;
>>
>>       t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
>> -    t->processor_family2 = cpu_to_le16(0x01); /* Other */
>> +    t->processor_family2 = cpu_to_le16(type4.processor_family);
>>
>>       if (tbl_len == SMBIOS_TYPE_4_LEN_V30) {
>>           t->core_count2 = t->core_enabled2 = cpu_to_le16(cores_per_socket);
>> @@ -1402,6 +1408,9 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>>                   return;
>>               }
>>               save_opt(&type4.sock_pfx, opts, "sock_pfx");
>> +            type4.processor_family = qemu_opt_get_number(opts,
>> +                                                         "processor-family",
>> +                                                         0x01 /* Other */);
>>               save_opt(&type4.manufacturer, opts, "manufacturer");
>>               save_opt(&type4.version, opts, "version");
>>               save_opt(&type4.serial, opts, "serial");
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index b66570ae00..7bdb414345 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2694,7 +2694,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>>       "                specify SMBIOS type 3 fields\n"
>>       "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
>>       "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
>> -    "              [,processor-id=%d]\n"
>> +    "              [,processor-family=%d,processor-id=%d]\n"
>>       "                specify SMBIOS type 4 fields\n"
>>       "-smbios type=8[,external_reference=str][,internal_reference=str][,connector_type=%d][,port_type=%d]\n"
>>       "                specify SMBIOS type 8 fields\n"
>> @@ -2722,7 +2722,7 @@ SRST
>>   ``-smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str][,sku=str]``
>>       Specify SMBIOS type 3 fields
>>
>> -``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-id=%d]``
>> +``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-family=%d][,processor-id=%d]``
>>       Specify SMBIOS type 4 fields
>>
>>   ``-smbios type=11[,value=str][,path=filename]``
>> --
>> 2.43.0
>>
>>


