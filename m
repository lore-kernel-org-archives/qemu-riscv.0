Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKGED-0006dS-QC
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 05:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKGDo-0006Xb-7U
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 05:08:10 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKGDl-0008HR-Q0
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 05:08:07 -0500
Received: by mail-wm1-x331.google.com with SMTP id g10so11018200wmo.1
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/SF36r8i+Z8W4TYL8FvIHMioH37dqgLJBRI+fSQpfWc=;
 b=QCRag0NoooLK+heS8bG2D0ldrob3bcfnlP0fc17T3y1t1KUwn6sz09+ewLZydw7X2Y
 ad7DnUy8zBTWt9n6hGtPJ4Gj/NRR7vXgnxGjtKQZnvUFS3Cd8jkRo0ilNO/+ILqL9fpz
 OOXMISGjy3/6BcKptKmWpHP/vK4yUIIDCxkVwvKfF+J3NKlTQzf5/GVtHGmZCyVYABRb
 Bhl20Q/gXOXqj+xa4PiR1267ai0/3PaY+2SkCtBREswtNuexWAsgo0IVhVGYR36rNzAP
 D6hwLY6s/ed1czDep4hT3terYuPLC0QQ+c8S4OcE+t/Y7q1Bed74EEimYT6JbRThIofi
 7wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/SF36r8i+Z8W4TYL8FvIHMioH37dqgLJBRI+fSQpfWc=;
 b=GtJsPuynvZmLbXTAsORfFnK8iW5xXdI6OUmF7tRXPGy5VwfmZ36iJtuzHaO+Ycd7BA
 f6GSjy9ZIdnC+6lw45ftt/QNpIHuqgAiYwuDyGmwUY0e3/M3kRFGDStVaAOPmiqLOZUB
 anx98psdoq9IPl86NDuuZ4Az2z8aTE4PDODeqJRKjXrLxycdzGW9cvefcZ7jFm+G6emK
 X01K3+F5dDxUeaGsgGcohYeILAigYJsAi1TKhWDicQBWQz/K81KgoeBg25HU5nHADv1M
 XhReprGSlfXFaOpx65oq9zEEYKO8HzrgbKjZUEFYvV6857Yef8As40OwAGpnx9a91190
 Z9aA==
X-Gm-Message-State: AFqh2kpBSAo/rSg+oD+3PraSDqSrYgdkvZzUdjBrEHPkY3JcJQFCDGmy
 /6iHCCLfjdLp04Vqp/5tYDRkJyb1WtAPi72bsLJV7Q==
X-Google-Smtp-Source: AMrXdXukbsxDm0D742UTfUIfaGrcBxOjXzH/zL+8iaHBAQQzA5pF1sw9AxggkFl7XJyiAERl4MqjjXNU/KqsnuAQTCc=
X-Received: by 2002:a05:600c:35c6:b0:3d1:e710:9905 with SMTP id
 r6-20020a05600c35c600b003d1e7109905mr1236227wmq.81.1674554884271; Tue, 24 Jan
 2023 02:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-6-alexghiti@rivosinc.com>
 <20230123105112.zidabgiswkpnzo5r@orel>
In-Reply-To: <20230123105112.zidabgiswkpnzo5r@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jan 2023 11:07:53 +0100
Message-ID: <CAHVXubjvwF+VOqKSXOF8WZsjY+NzEEXVKyAxh+L02Shu0TKASA@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] riscv: Introduce satp mode hw capabilities
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 24 Jan 2023 10:08:17 -0000

On Mon, Jan 23, 2023 at 11:51 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jan 23, 2023 at 10:03:24AM +0100, Alexandre Ghiti wrote:
> > Currently, the max satp mode is set with the only constraint that it must be
> > implemented in qemu, i.e. set in valid_vm_1_10_[32|64].
> >
> > But we actually need to add another level of constraint: what the hw is
> > actually capable of, because currently, a linux booting on a sifive-u54
> > boots in sv57 mode which is incompatible with the cpu's sv39 max
> > capability.
> >
> > So add a new bitmap to RISCVSATPMap which contains this capability and
> > initialize it in every XXX_cpu_init.
> >
> > Finally, we have the following chain of constraints:
> >
> > Qemu capability > HW capability > User choice > Software capability
>
>                                                   ^ What software is this?
>                          I'd think the user's choice would always be last.

Hmm maybe that's not clear, but I meant that the last constraint was
what the emulated software is capable of handling.

>
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  target/riscv/cpu.c | 78 +++++++++++++++++++++++++++++++---------------
> >  target/riscv/cpu.h |  8 +++--
> >  2 files changed, 59 insertions(+), 27 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index e409e6ab64..19a37fee2b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -292,24 +292,39 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
> >      g_assert_not_reached();
> >  }
> >
> > -/* Sets the satp mode to the max supported */
> > -static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> > +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> > +                                        const char *satp_mode_str,
> > +                                        bool is_32_bit)
> >  {
> > -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> > -        cpu->cfg.satp_mode.map |=
> > -                        (1 << satp_mode_from_str(is_32_bit ? "sv32" : "sv57"));
> > -    } else {
> > -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> > +    uint8_t satp_mode = satp_mode_from_str(satp_mode_str);
> > +    const bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;
> > +
> > +    for (int i = 0; i <= satp_mode; ++i) {
> > +        if (valid_vm[i]) {
> > +            cpu->cfg.satp_mode.supported |= (1 << i);
>
> I don't think we need a new 'supported' bitmap, I think each board that
> needs to further constrain va-bits from what QEMU supports should just set
> valid_vm_1_10_32/64. I.e. drop const from the arrays and add an init
> function something like
>
>  #define QEMU_SATP_MODE_MAX VM_1_10_SV64
>
>  void riscv_cpu_set_satp_mode_max(RISCVCPU *cpu, uint8_t satp_mode_max)
>  {
>      bool is_32_bit = cpu->env.misa_mxl == MXL_RV32;
>      bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;
>
>      g_assert(satp_mode_max <= QEMU_SATP_MODE_MAX);
>      g_assert(!is_32_bit || satp_mode_max < 2);
>
>      memset(valid_vm, 0, sizeof(*valid_vm));
>
>      for (int i = 0; i <= satp_mode_max; i++) {
>          valid_vm[i] = true;
>      }
>  }
>
> The valid_vm[] checks already in finalize should then manage the
> validation needed to constrain boards. Only boards that care about
> this need to call this function, otherwise they'll get the default.
>
> Also, this patch should come before the patch that changes the default
> for all boards to sv57 in order to avoid breaking bisection.
>
> Thanks,
> drew

