Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0POP-00059w-0g
	for mharc-qemu-riscv@gnu.org; Fri, 15 Jan 2021 08:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0POL-00058t-SG; Fri, 15 Jan 2021 08:43:54 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0POI-00049I-Ng; Fri, 15 Jan 2021 08:43:53 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id 18so5075393ybx.2;
 Fri, 15 Jan 2021 05:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LwMEl09LPQkfeGvNBLWB1ahF5RkWrcXXzXHIq4IUuS4=;
 b=D4Gxkxr79qg2dmNESL3vmB76sBZtw7E1EVdan7ptPLMf646U9kq4G2mWXrxKiy2lkN
 LCkTv7l+PhQIps22QP2yXdy2PTQE5lJsJI3QdSSZQw9kTkANlEyn9HRCXoxT4+Pbv4Wd
 o2dXZmKH6/t+s1CIXPRTE135WUejuHUBAD10xb0lOaPCwHC4hxfn6GlbUwIR5Mh77s3v
 P652W4WOqohzv0cLUO9D9autjJhiPPp18qPVbFtg4eYJv7M0SgK/EM31fwjgy6b0aq5K
 m+dx6NNS5mUBR3E0nAqYExdmQ1TOX6EmddutSjikFBZL1Mbf4L15wIA1e+FEYImPB6Vm
 Nd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LwMEl09LPQkfeGvNBLWB1ahF5RkWrcXXzXHIq4IUuS4=;
 b=BMDfLkkuOTufRRcDR5m2ax0sC6lPbCM59QMlwzwXf4TtpENU/EfrjUCtNe95T5EWMl
 YL0zMdSmuhjqC0xWd8movtM6PsfU5FV9Vo9iO49Gxr5ALp+oSdT4d/DR/Gz8iqon/geS
 83mMtyfisJ8wA4gCuZ+iv4/wv3Msyj8VRh8nqym7IN+GCut00WMrkYw+wHZ5c3x9YgeP
 n0JGliZbVUFQW2gTK98l17JH3lsvE/oya9S0j8oElkRWZX6+PnCfsjNmf9thOGOnN5K2
 hBWGOGN/uevmYzc201D+KI66pbrh5JvNIIn5rZhG8U9PE0RV8JsqFp+gTWqATWKuNdbZ
 JdIg==
X-Gm-Message-State: AOAM533Da1Fbm9oZYAA8WyGqnNSqYA542kOnmQOXEZYzNWZCjK2r39D4
 y6oOK42eS5+h9U5Sjk77YtV4aSIPLpUHt+cnVIU=
X-Google-Smtp-Source: ABdhPJzYNAonF/YqCfpvd7vhbnCg9adLX8wvjt7cMZGa+7Xv1jg9zhY9UfIiC0vqu6LwG2V35MO16Iv99DH8BBs0xUE=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr4687076ybp.314.1610718229272; 
 Fri, 15 Jan 2021 05:43:49 -0800 (PST)
MIME-Version: 1.0
References: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
 <1610427124-49887-3-git-send-email-bmeng.cn@gmail.com>
 <CAEeofcgCkcRw-HcakxY+canSO3=PYfVEvEi_uWdKcW9gydsBiw@mail.gmail.com>
In-Reply-To: <CAEeofcgCkcRw-HcakxY+canSO3=PYfVEvEi_uWdKcW9gydsBiw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Jan 2021 21:43:38 +0800
Message-ID: <CAEUhbmWc6_wRiiPf8amNEiNOYZ8o3k4dUZkBp0dbszPnvgzQaQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Add CSR name in the CSR function table
To: Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>
Cc: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Jan 2021 13:43:55 -0000

Hi Alex,

On Fri, Jan 15, 2021 at 9:14 PM Alexander Richardson
<Alexander.Richardson@cl.cam.ac.uk> wrote:
>
> On Tue, 12 Jan 2021 at 05:02, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > In preparation to generate the CSR register list for GDB stub
> > dynamically, let's add the CSR name in the CSR function table.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  target/riscv/cpu.h |   1 +
> >  target/riscv/csr.c | 332 +++++++++++++++++++++++++++++++++++++++--------------
> >  2 files changed, 249 insertions(+), 84 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 6f9e1cc..6684316 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -476,6 +476,7 @@ typedef int (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
> >      target_ulong *ret_value, target_ulong new_value, target_ulong write_mask);
> >
> >  typedef struct {
> > +    const char *name;
> >      riscv_csr_predicate_fn predicate;
> >      riscv_csr_read_fn read;
> >      riscv_csr_write_fn write;
>
> In our CHERI fork, we also added the name to this table for better
> instruction logging output:
> <https://github.com/CTSRD-CHERI/qemu/commit/446dbebdfd7d8f9b75041041f5e8c5ebc8f815b8#diff-ff63c6a6531e6beae8637664aed5a008f79c76b8f14fd941c370d28c670faa12R1396>

Thanks for the info.

> We used some macros to avoid repeating the same string multiple times:
> in that patch we use e.g. [CSR_FCSR] = CSR_OP_RW(fs, fcsr)," instead
> of
> "[CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },"
> Would it make sense to upstream these helper macros? This would
> significantly reduce merge conflicts on our side in the future.
>

Anyway there will be a merge conflict. So the question is: do you guys
want to upstream the CSR logging changes you mentioned in your fork?
If not, I am not sure if it brings enough value to just upstream the
macros but maybe others have a different view.

If the answer is yes, then whoever upstreams the macro changes has to
deal with that unfortunately :(

Regards,
Bin

