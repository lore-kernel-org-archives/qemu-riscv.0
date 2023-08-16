Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2FFC001E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:01:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHzR-0004Ns-QK; Wed, 16 Aug 2023 10:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHzQ-0004Mu-QY
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:59:16 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHzN-00039z-V1
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:59:16 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6889078ee66so536193b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197953; x=1692802753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wnK+nXwiY34n/cX3vy5Mw8R6f+1hLElewAW0h7Fh4To=;
 b=xymqgA25VCjHvRPzlUsf87yKL5YuwjbPic8ZfDUzkWxFdwY7ABa8sDcUnN8P4XNL5Q
 8r5Jiqs3TNJGZOMOhPwk9YEhc9dZ1bksECUJj28kTksZFg8ohmUHUtWjyhjMOdEm8RTM
 fFnkacJatiB2eeEYrsehTpt5SgG0KhnGV8a3Z764H3KXpMnnK7wxQz6oWws8s1/cHhL4
 7+ArVoczjy51o3rBU+xgtSdo27LfQvXKe44Ub01r95atOKB2AaFwMb+8QsR/bums6HeS
 iFcbqSQRE1nOR8OvzTnfFy2JjiPRVNj6B8lcpfVoYmnwcqbMg1sCAWN/2hmyd7LZwD3V
 3jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692197953; x=1692802753;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wnK+nXwiY34n/cX3vy5Mw8R6f+1hLElewAW0h7Fh4To=;
 b=kBZhaKfqTWdZrZaFzNTr0M1Q2agJYpAGI7GTLof6GgGB/RTr0y5x1xZUBjJH21wNkY
 VaizdC8zlu7EMtLkTRUmkIi8qne+wsW7ycXOlpA+Nnie/XMMIZ1pbscCagf5hB7+8ZMF
 UI6sD2xF6nCYzl8y4Cptnl28uKv+ehTWteHIyR4ZPe4ndI/JUOGQGL/L6xb+q7M+0VPi
 vM+Q+FyrZ9CEm9y3lPFOqNXymwOiraq8BiaD0QGyx50fNZMNgN7/NpuEEDVHriCgfFI+
 TfTF2eVVuoz5uSU9Yn3X3aHtJiPiyLvvu7phZYfE+P4f0m44pq1Rp4XvPHDVOe7It3lJ
 i5mA==
X-Gm-Message-State: AOJu0YxkRZjpWf5xfxj5VZSkkLPKqoQzldrbXJqTnv+CikEV2E9JvTYr
 WwErCgUpOFJaq07RNMBR68jaeQ==
X-Google-Smtp-Source: AGHT+IHPVQsrvOO/RooUR6gCdyrbCDX2HyJ+yX9POMmtY1irInGXZce+cwwxEpMqG4SI9aqiTHSZ9w==
X-Received: by 2002:a05:6a00:3928:b0:686:fd66:a41c with SMTP id
 fh40-20020a056a00392800b00686fd66a41cmr2549543pfb.17.1692197951199; 
 Wed, 16 Aug 2023 07:59:11 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 e26-20020aa7825a000000b00686dd062207sm11226977pfn.150.2023.08.16.07.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 07:59:10 -0700 (PDT)
Message-ID: <1e71e3fe-8d34-4a66-aba6-aa0f569fbda2@daynix.com>
Date: Wed, 16 Aug 2023 23:59:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 22/24] contrib/plugins: Allow to log registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-23-akihiko.odaki@daynix.com>
 <87ttt1ps02.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87ttt1ps02.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/08/15 0:21, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> This demonstrates how a register can be read from a plugin.
> 
> I think it would be a little more useful as a demo if it tracked changes
> to the register state rather than dumping it for every line executed.
> 
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   docs/devel/tcg-plugins.rst |  10 ++-
>>   contrib/plugins/execlog.c  | 130 ++++++++++++++++++++++++++++---------
>>   2 files changed, 108 insertions(+), 32 deletions(-)
>>
>> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
>> index 81dcd43a61..c9f8b27590 100644
>> --- a/docs/devel/tcg-plugins.rst
>> +++ b/docs/devel/tcg-plugins.rst
>> @@ -497,6 +497,15 @@ arguments if required::
>>     $ qemu-system-arm $(QEMU_ARGS) \
>>       -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin
>>   
>> +This plugin can also dump a specified register. The specification of register
>> +follows `GDB standard target features <https://sourceware.org/gdb/onlinedocs/gdb/Standard-Target-Features.html>`__.
>> +
>> +Specify the name of the feature that contains the register and the name of the
>> +register with ``rfile`` and ``reg`` options, respectively::
>> +
>> +  $ qemu-system-arm $(QEMU_ARGS) \
>> +    -plugin ./contrib/plugins/libexeclog.so,rfile=org.gnu.gdb.arm.core,reg=sp -d plugin
>> +
>>   - contrib/plugins/cache.c
>>   
>>   Cache modelling plugin that measures the performance of a given L1 cache
>> @@ -583,4 +592,3 @@ The following API is generated from the inline documentation in
>>   include the full kernel-doc annotations.
>>   
>>   .. kernel-doc:: include/qemu/qemu-plugin.h
>> -
>> diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
>> index ce67acf145..031ad67fbb 100644
>> --- a/contrib/plugins/execlog.c
>> +++ b/contrib/plugins/execlog.c
>> @@ -15,27 +15,42 @@
>>   
>>   #include <qemu-plugin.h>
>>   
>> +typedef struct CPU {
>> +    /* Store last executed instruction on each vCPU as a GString */
>> +    GString *last_exec;
>> +    GByteArray *reg_buf;
>> +
>> +    int reg;
>> +} CPU;
>> +
>>   QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
>>   
>> -/* Store last executed instruction on each vCPU as a GString */
>> -static GPtrArray *last_exec;
>> +static CPU *cpus;
>> +static int num_cpus;
>>   static GRWLock expand_array_lock;
>>   
>>   static GPtrArray *imatches;
>>   static GArray *amatches;
>>   
>> +static char *rfile_name;
>> +static char *reg_name;
>> +
>>   /*
>> - * Expand last_exec array.
>> + * Expand cpu array.
>>    *
>>    * As we could have multiple threads trying to do this we need to
>>    * serialise the expansion under a lock.
>>    */
>> -static void expand_last_exec(int cpu_index)
>> +static void expand_cpu(int cpu_index)
>>   {
>> -    g_rw_lock_writer_unlock(&expand_array_lock);
>> -    while (cpu_index >= last_exec->len) {
>> -        GString *s = g_string_new(NULL);
>> -        g_ptr_array_add(last_exec, s);
>> +    g_rw_lock_writer_lock(&expand_array_lock);
>> +    if (cpu_index >= num_cpus) {
>> +        cpus = g_realloc_n(cpus, cpu_index + 1, sizeof(*cpus));
>> +        while (cpu_index >= num_cpus) {
>> +            cpus[num_cpus].last_exec = g_string_new(NULL);
>> +            cpus[num_cpus].reg_buf = g_byte_array_new();
>> +            num_cpus++;
>> +        }
>>       }
>>       g_rw_lock_writer_unlock(&expand_array_lock);
>>   }
>> @@ -50,8 +65,8 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
>>   
>>       /* Find vCPU in array */
>>       g_rw_lock_reader_lock(&expand_array_lock);
>> -    g_assert(cpu_index < last_exec->len);
>> -    s = g_ptr_array_index(last_exec, cpu_index);
>> +    g_assert(cpu_index < num_cpus);
>> +    s = cpus[cpu_index].last_exec;
>>       g_rw_lock_reader_unlock(&expand_array_lock);
>>   
>>       /* Indicate type of memory access */
>> @@ -77,28 +92,35 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t info,
>>    */
>>   static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
>>   {
>> -    GString *s;
>> +    CPU cpu;
>> +    int n;
>> +    int i;
>>   
>>       /* Find or create vCPU in array */
>>       g_rw_lock_reader_lock(&expand_array_lock);
>> -    if (cpu_index >= last_exec->len) {
>> -        g_rw_lock_reader_unlock(&expand_array_lock);
>> -        expand_last_exec(cpu_index);
>> -        g_rw_lock_reader_lock(&expand_array_lock);
>> -    }
>> -    s = g_ptr_array_index(last_exec, cpu_index);
>> +    cpu = cpus[cpu_index];
>>       g_rw_lock_reader_unlock(&expand_array_lock);
>>   
>>       /* Print previous instruction in cache */
>> -    if (s->len) {
>> -        qemu_plugin_outs(s->str);
>> +    if (cpu.last_exec->len) {
>> +        qemu_plugin_outs(cpu.last_exec->str);
>>           qemu_plugin_outs("\n");
>>       }
>>   
>>       /* Store new instruction in cache */
>>       /* vcpu_mem will add memory access information to last_exec */
>> -    g_string_printf(s, "%u, ", cpu_index);
>> -    g_string_append(s, (char *)udata);
>> +    g_string_printf(cpu.last_exec, "%u, ", cpu_index);
>> +    g_string_append(cpu.last_exec, (char *)udata);
>> +
>> +    if (cpu.reg >= 0) {
>> +        g_string_append(cpu.last_exec, ", reg,");
>> +        n = qemu_plugin_read_register(cpu.reg_buf, cpu.reg);
>> +        for (i = 0; i < n; i++) {
>> +            g_string_append_printf(cpu.last_exec, " 0x%02X",
>> +                                   cpu.reg_buf->data[i]);
>> +        }
> 
> so instead of:
> 
>    0, 0x4001b4, 0xd10043ff, "sub sp, sp, #0x10", reg, 0x70 0xFF 0x7F 0x00 0x00 0x40 0x00 0x00
> 
> we could aim for something like:
> 
>    0, 0x4001b4, 0xd10043ff, "sub sp, sp, #0x10", sp => 0x70ff7f0000400000

I changed this plugin so that it only emits register values when changed 
in v4 (I noticed I sent a wrong patch in v3), but it's not readable as 
much as your suggestion. It now emits like:

0, 0x4001b4, 0xd10043ff, "sub sp, sp, #0x10", reg, 70 ff 7f 00 00 40 00 00

This is because it's following the current CSV-like format of execlog 
output.

It will not also emit the value like 0x70ff7f0000400000 since the plugin 
does not know how the bytes should be interpreted. In fact, in this case 
I think it is in little endian and should be written as 0x4000007fff70. 
However the plugin does not have such knowledge.

> 
> 
>> +        g_byte_array_set_size(cpu.reg_buf, 0);
>> +    }
>>   }
>>   
>>   /**
>> @@ -167,8 +189,10 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
>>                                                QEMU_PLUGIN_MEM_RW, NULL);
>>   
>>               /* Register callback on instruction */
>> -            qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
>> -                                                   QEMU_PLUGIN_CB_NO_REGS, output);
>> +            qemu_plugin_register_vcpu_insn_exec_cb(
>> +                insn, vcpu_insn_exec,
>> +                rfile_name ? QEMU_PLUGIN_CB_R_REGS : QEMU_PLUGIN_CB_NO_REGS,
>> +                output);
>>   
>>               /* reset skip */
>>               skip = (imatches || amatches);
>> @@ -177,17 +201,53 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
>>       }
>>   }
>>   
>> +static void vcpu_init(qemu_plugin_id_t id, unsigned int vcpu_index)
>> +{
>> +    int reg = 0;
>> +    bool found = false;
>> +
>> +    expand_cpu(vcpu_index);
>> +
>> +    if (rfile_name) {
>> +        int i;
>> +        int j;
>> +        int n;
>> +
>> +        qemu_plugin_register_file_t *rfiles =
>> +            qemu_plugin_get_register_files(vcpu_index, &n);
>> +
>> +        for (i = 0; i < n; i++) {
>> +            if (g_strcmp0(rfiles[i].name, rfile_name) == 0) {
>> +                for (j = 0; j < rfiles[i].num_regs; j++) {
>> +                    if (g_strcmp0(rfiles[i].regs[j], reg_name) == 0) {
>> +                        reg += j;
>> +                        found = true;
>> +                        break;
>> +                    }
>> +                }
>> +                break;
>> +            }
>> +
>> +            reg += rfiles[i].num_regs;
>> +        }
>> +
>> +        g_free(rfiles);
>> +    }
>> +
>> +    g_rw_lock_writer_lock(&expand_array_lock);
>> +    cpus[vcpu_index].reg = found ? reg : -1;
>> +    g_rw_lock_writer_unlock(&expand_array_lock);
>> +}
>> +
>>   /**
>>    * On plugin exit, print last instruction in cache
>>    */
>>   static void plugin_exit(qemu_plugin_id_t id, void *p)
>>   {
>>       guint i;
>> -    GString *s;
>> -    for (i = 0; i < last_exec->len; i++) {
>> -        s = g_ptr_array_index(last_exec, i);
>> -        if (s->str) {
>> -            qemu_plugin_outs(s->str);
>> +    for (i = 0; i < num_cpus; i++) {
>> +        if (cpus[i].last_exec->str) {
>> +            qemu_plugin_outs(cpus[i].last_exec->str);
>>               qemu_plugin_outs("\n");
>>           }
>>       }
>> @@ -224,9 +284,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>>        * we don't know the size before emulation.
>>        */
>>       if (info->system_emulation) {
>> -        last_exec = g_ptr_array_sized_new(info->system.max_vcpus);
>> -    } else {
>> -        last_exec = g_ptr_array_new();
>> +        cpus = g_new(CPU, info->system.max_vcpus);
>>       }
>>   
>>       for (int i = 0; i < argc; i++) {
>> @@ -236,13 +294,23 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>>               parse_insn_match(tokens[1]);
>>           } else if (g_strcmp0(tokens[0], "afilter") == 0) {
>>               parse_vaddr_match(tokens[1]);
>> +        } else if (g_strcmp0(tokens[0], "rfile") == 0) {
>> +            rfile_name = g_strdup(tokens[1]);
>> +        } else if (g_strcmp0(tokens[0], "reg") == 0) {
>> +            reg_name = g_strdup(tokens[1]);
>>           } else {
>>               fprintf(stderr, "option parsing failed: %s\n", opt);
>>               return -1;
>>           }
>>       }
>>   
>> +    if ((!rfile_name) != (!reg_name)) {
>> +        fputs("file and reg need to be set at the same time\n", stderr);
>> +        return -1;
>> +    }
>> +
>>       /* Register translation block and exit callbacks */
>> +    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
>>       qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>>       qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
> 
> 

