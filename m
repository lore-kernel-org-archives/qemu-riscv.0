Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jzLl6-0006w6-Nj
	for mharc-qemu-riscv@gnu.org; Sat, 25 Jul 2020 11:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLl2-0006tM-M3
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2020 11:06:40 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jzLl1-0000Z7-46
 for qemu-riscv@nongnu.org; Sat, 25 Jul 2020 11:06:40 -0400
Received: by mail-ot1-x343.google.com with SMTP id w17so9199400otl.4
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2020 08:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XttOHD7A3DU9UnjTX4sQKU0XSSsO6qOpX3u6elnBRko=;
 b=fktfSZai1mwBY5mtwk5ddn7KR6t6ruLpeKaJOO9OENIIn7+JpaQXbkQGFSUdEOmj1g
 xeTM4nDPCffVe+idQSNwuQerU0zGp3jWPso/MzMc3T21lZeKT/t/y3izJQP8PC7eu6iC
 w9iHHnHMNi+RNSaaPksCNbfx59lXAlRfWNohxaVzLcxiflqhq01kbqA26bDh/1h4Roi/
 r1g1Amdbc7xAP1WwZfdPl9ncuO4H8U+WcKuPUBIS1G+Lvz5FScBYGOPw8wWAcdBw2Rx6
 RamdnOeEG02Ci92iWFWr1tr/sF88srfOvsKrs4PkkBqK4qaQYNg/q5FQR9P3x2D6f2tI
 rsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XttOHD7A3DU9UnjTX4sQKU0XSSsO6qOpX3u6elnBRko=;
 b=hUo/L1+I5DB/q3aFR85smLdT5W563yB75x3WMGKPAQyxrwxmjkXsm1ufAjfAj1YC+u
 ayKk8qybuAVsOkdLuFe3ceOn0XlQv2dAr7EyGmnOJskIyWjjBCc6ZdA8C27VJS4IwvPF
 NmEJ2yFqHFyE+UWmHJBbPP60pYycoFOfQPMCOZEKdeDMZsLQQff5TbmClazyB9cvRpA+
 m+8cHIJ2/60uFu555nTcyKL0dFp7OH7dwOxaJq1jEeQllVdgfAm+a+TTv03Pdixyjzgx
 hGRdpk3CeNYI5GIezwFNu/qoYb2cDXIYjYVT48PShamXpEi5o9Rkq+PhP7+bKNEnJBcp
 u2gA==
X-Gm-Message-State: AOAM530bg6W99Od1WVsunslsHN5rMbt4UuNQrIwObSYvoA4vlUBFrc0E
 alRTXhXmHwRAQq77/3tPweCy4RSMC0rQrs9Y3UZF4Q==
X-Google-Smtp-Source: ABdhPJwR+Dk4vJ/9wC11WXJRDChrhJkYyEjcYRxKpawV+PfgobvQ7MYoPnpxZ6zi97Ud4oGVXPN+2nChrNuS86kAqx8=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr14318006otj.127.1595689597812; 
 Sat, 25 Jul 2020 08:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595581140.git.zong.li@sifive.com>
 <56c2770fc75e1e0c833248ea5d9faa038b69e328.1595581140.git.zong.li@sifive.com>
 <CAEUhbmX-va3wLY_aU7QYXE0ke0sn-4mfenz5Mszy+2k9NMib9A@mail.gmail.com>
In-Reply-To: <CAEUhbmX-va3wLY_aU7QYXE0ke0sn-4mfenz5Mszy+2k9NMib9A@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Sat, 25 Jul 2020 23:06:27 +0800
Message-ID: <CANXhq0oDTLKQ-2c90h9J0G2Pj58=na2goby4u9Z3mctZRzwYOg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] target/riscv/pmp.c: Fix the index offset on RV64
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=zong.li@sifive.com; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Jul 2020 15:06:40 -0000

On Fri, Jul 24, 2020 at 5:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Zong,
>
> On Fri, Jul 24, 2020 at 5:08 PM Zong Li <zong.li@sifive.com> wrote:
> >
> > On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
> > entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
> > implementation, the second parameter of pmp_write_cfg is
> > "reg_index * sizeof(target_ulong)", and we get the the result
> > which is started from 16 if reg_index is 2, but we expect that
> > it should be started from 8. Separate the implementation for
> > RV32 and RV64 respectively.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  target/riscv/pmp.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index 2a2b9f5363..e0161d6aab 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -310,6 +310,10 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
> >      int i;
> >      uint8_t cfg_val;
> >
> > +#if defined(TARGET_RISCV64)
> > +    reg_index >>= 1;
> > +#endif
> > +
> >      trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
> >
> >      if ((reg_index & 1) && (sizeof(target_ulong) == 8)) {
> > @@ -335,6 +339,10 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
> >      target_ulong cfg_val = 0;
> >      target_ulong val = 0;
> >
> > +#if defined(TARGET_RISCV64)
> > +    reg_index >>= 1;
> > +#endif
> > +
> >      for (i = 0; i < sizeof(target_ulong); i++) {
> >          val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
> >          cfg_val |= (val << (i * 8));
> > --
>
> It seems you missed to address my review comments in v3? reg_index
> should be shifted after we call the trace function.
>

Sorry for that, there was something wrong in my local tree, I have
been posting the 5th version patches, and hope it picks the suggestion
already. Thanks.

> Regards,
> Bin

