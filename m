Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nkekP-0006qT-Dp
	for mharc-qemu-riscv@gnu.org; Sat, 30 Apr 2022 00:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nkekH-0006pz-IB
 for qemu-riscv@nongnu.org; Sat, 30 Apr 2022 00:30:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nkekD-0007bP-4p
 for qemu-riscv@nongnu.org; Sat, 30 Apr 2022 00:30:12 -0400
Received: by mail-wm1-x32a.google.com with SMTP id k126so2182207wme.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Apr 2022 21:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9d3xmi1pzvf41af7ZsKLn8yhSU1BVM/DTv7PEhWN8VQ=;
 b=Xth+wVk5o7nk+hLDqZHrVf7hjKuezDPWSiNcrYYpypPtwlzKCXPO77p5aZ6hvngFxn
 ekCY0W71Kc6YZPOlmlfKmvUEJcT/cF/P0M07s+iYx/u55HO+II7ylEWQ2nfS875q7siW
 K99Bfd0vf1j//6Sh0M+0Uu4Lh6C5BYe+9j3P95ZEUFdTsUecj3FXbO38ayj44RRgn9pF
 gTSRG7vVhuIHUD5OlOgk8xfRMZk4M1qupHMU8kge0/xRKVTdqeU0GpjD0A85gfzDuZxK
 +zqBErwWFuhbPJ/mD8wIfNpr3PFi0DIqD1v60wU1DWFH3r+23kut+Jrr8JNdbq0l0RJr
 TJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9d3xmi1pzvf41af7ZsKLn8yhSU1BVM/DTv7PEhWN8VQ=;
 b=B6HnBAiSSpeoClSgnf9nmfLI3njDVa9C3vdZ1UqOioG/alV+wjjK2s2Lv7lVGfpEME
 BBoGPGIYq3HRn13FZjDAlSgFDlX7euEyyqpCrgIG9wt3RuxGa4ow9q01bNtmaCW55MV4
 1hg6/8kG2ZRhARJra9y3p6GDhFpiYuDGIAVJseBUD3JNUM15aVB0pvg/9bnGCSAlmRN6
 AlsHBAH69MNdj9AmvxDd2VjAH/1BnwIcSvC87lS0kr3qc1UMIHRLEhAmaIa4F+hhEhBW
 tncU9KBK2rYIPBxiA50bnQ6X1hmFvdo1Shczjd6rIkdRCKKKKPMZtTd6jbEZv1AC1IM0
 UC7g==
X-Gm-Message-State: AOAM530li3l0n5JL7odhzs4JpsvS0NAgUv/Bw5w80LEj2nUfJpjszHJI
 sAUPYE91vTvuRbOJPMdtsgHLi4WfHQk/UpkjEvtYIw==
X-Google-Smtp-Source: ABdhPJz73ZHZEv2RdfikUJYDAa3UxDfZr53VHtMvrCLVGIPuwYpRzgg/Xx/eLy/DtvclRJvKEEWhkenBW5ae7tkIIJM=
X-Received: by 2002:a7b:c190:0:b0:394:116d:5e0b with SMTP id
 y16-20020a7bc190000000b00394116d5e0bmr5918121wmi.108.1651293004352; Fri, 29
 Apr 2022 21:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-4-apatel@ventanamicro.com>
 <CANzO1D1M-wH-r-T58E9qJ7X5MTruiAXP87UdYikWanrXgswuJA@mail.gmail.com>
In-Reply-To: <CANzO1D1M-wH-r-T58E9qJ7X5MTruiAXP87UdYikWanrXgswuJA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Apr 2022 09:59:52 +0530
Message-ID: <CAAhSdy27e84WXJ8fKjzN9RxRoPvz5gmwUN3na2cMFGuJ5TpjAg@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/riscv: Consider priv spec version when
 generating ISA string
To: Frank Chang <frank.chang@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 30 Apr 2022 04:30:19 -0000

On Sat, Apr 30, 2022 at 8:39 AM Frank Chang <frank.chang@sifive.com> wrote:
>
> Hi Anup,
>
> If we want to limit the generated ISA string to/after a specific privilege spec version.
> Shouldn't we also check the privilege spec version when these extensions are enabled?
> Otherwise, it's possible that one extension is enabled,
> but the privilege spec version is smaller than the one in which the extension is supported.
> (This is possible if user specifies the privileged spec version through the command line.)
> The ISA string therefore won't include the enabled extension.

This patch is only a temporary fix for the sifive_u machine where I am
seeing some
of these new extensions available in ISA string.

We need a separate series to have the priv spec version influence
individual extension
enabling/disabling.

Regards,
Anup

>
> Regards,
> Frank Chang
>
>
> On Fri, Apr 29, 2022 at 11:49 PM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> Most of the multi-letter extensions (such as Svpbmt, Svnapot, Svinval,
>> etc) are only available after Priv spec v1.12 so ISA string generation
>> should check the minimum required priv spec version for all extensions.
>>
>> Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
>> device tree")
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> ---
>>  target/riscv/cpu.c | 36 +++++++++++++++++++-----------------
>>  1 file changed, 19 insertions(+), 17 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 02ee7d45d8..d8c88b96bc 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -44,6 +44,7 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>>  struct isa_ext_data {
>>      const char *name;
>>      bool enabled;
>> +    uint32_t min_priv_ver;
>>  };
>>
>>  const char * const riscv_int_regnames[] = {
>> @@ -974,7 +975,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>>      device_class_set_props(dc, riscv_cpu_properties);
>>  }
>>
>> -#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
>> +#define ISA_EDATA_ENTRY(name, prop, priv) {#name, cpu->cfg.prop, priv}
>>
>>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>>  {
>> @@ -1000,25 +1001,26 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>>       *    extensions by an underscore.
>>       */
>>      struct isa_ext_data isa_edata_arr[] = {
>> -        ISA_EDATA_ENTRY(zfh, ext_zfh),
>> -        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>> -        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
>> -        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
>> -        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
>> -        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
>> -        ISA_EDATA_ENTRY(zba, ext_zba),
>> -        ISA_EDATA_ENTRY(zbb, ext_zbb),
>> -        ISA_EDATA_ENTRY(zbc, ext_zbc),
>> -        ISA_EDATA_ENTRY(zbs, ext_zbs),
>> -        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
>> -        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
>> -        ISA_EDATA_ENTRY(svinval, ext_svinval),
>> -        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
>> -        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
>> +        ISA_EDATA_ENTRY(zfh, ext_zfh, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zfinx, ext_zfinx, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zhinx, ext_zhinx, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zdinx, ext_zdinx, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zba, ext_zba, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zbb, ext_zbb, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zbc, ext_zbc, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zbs, ext_zbs, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zve32f, ext_zve32f, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(zve64f, ext_zve64f, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(svinval, ext_svinval, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(svnapot, ext_svnapot, PRIV_VERSION_1_12_0),
>> +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt, PRIV_VERSION_1_12_0),
>>      };
>>
>>      for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>> -        if (isa_edata_arr[i].enabled) {
>> +        if (isa_edata_arr[i].enabled &&
>> +            cpu->env.priv_ver >= isa_edata_arr[i].min_priv_ver) {
>>              new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>>              g_free(old);
>>              old = new;
>> --
>> 2.34.1
>>
>>

