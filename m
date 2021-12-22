Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzxon-00083B-NM
	for mharc-qemu-riscv@gnu.org; Wed, 22 Dec 2021 04:21:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mzxom-00082t-RT
 for qemu-riscv@nongnu.org; Wed, 22 Dec 2021 04:21:52 -0500
Received: from [2a00:1450:4864:20::42c] (port=43894
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mzxol-0002EQ-5j
 for qemu-riscv@nongnu.org; Wed, 22 Dec 2021 04:21:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v11so3521835wrw.10
 for <qemu-riscv@nongnu.org>; Wed, 22 Dec 2021 01:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CdpsWbpmfVOm1srHfBrUthHDr/pq8aMO9TIQNY/fLlY=;
 b=cJRJM+DiK1rz5NB/qVhgxgUzZl1qmDxq7Tg/hwPpbLyiXeEnX+P67DyTR4YT+G5yO6
 zUDnO4ComvRkCu1ZDAdy4A1i1JCdjmFRRNRbCRomvCd3KdxlSO6y1Uo5ROLeczHDtv9+
 ++1ANXRuqMDxWR/IxmfOxfaz1b9NesRK6b8VW/DQkrvo9ljIE9MAgb5J6eAsRrRrhMxi
 KVMz/smVYxjbKmD6iOPSRbqJ6AfJjNX9kHpGLk3HefJHUNrCe4tFJbO2/NRt8kjDpJU0
 XI/Jn2/CwzBD8Q/K+0vy1KaFYl+ZhYnC/raT2oFcdGnCd+9LbGALy3WQWj84DIlfMrHM
 u+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CdpsWbpmfVOm1srHfBrUthHDr/pq8aMO9TIQNY/fLlY=;
 b=B/tXb/oOX+Cy2wxjoAQyShQF43Xr9PKBs7b3RA4QQmrTYlF+h34t7tmK6oDi6rrzAe
 K97W5GmKX9EBkR5hG1wC0s3Ghl+dmMBT6f09EYFOSqUjJG733sIZKiMbBheWRfDD8hI6
 +YvreyQ3lmHaiDJ1cfN6UjvXN/lFhdeujxMXCUT1HNooZHKI8dGjIbrjRil7gq+Pzp++
 T1i2jrMQibOSglKCBA4UcopMbzvSi6lgG1JhApsOAzs/1+GKx1i1EVTnhRIPWUUKoQQF
 v7n8RI7cmAtQ1yyucMuNzjrCf1dLzMYqYffVpQoAgxqpm4qWzvkDQpyKHL6WvVg4l7IP
 K5WQ==
X-Gm-Message-State: AOAM531WamijhNT18p/jf+6i0ZAEhF0RDoWVuWz9bDk3enWqVKNt2E4k
 OFp23gT4ZIAeKw/HaUwYA7m1YCBVF+0F+dBrzcZ+OQ==
X-Google-Smtp-Source: ABdhPJzlEo9yWtrHfOUTwlmMPmriT19osxSDv2x+Rgq7z0ACImykp0UIbHfOVSEYP2sebLqca7Ksfo19vuC9RN7ccBU=
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr1483467wrn.690.1640164909026; 
 Wed, 22 Dec 2021 01:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20211211041917.135345-1-anup.patel@wdc.com>
 <20211211041917.135345-14-anup.patel@wdc.com>
 <CAKmqyKNTF7mQP-oxeWL94XgywQGehSL6y6U_JJws9wOkT8dUPg@mail.gmail.com>
In-Reply-To: <CAKmqyKNTF7mQP-oxeWL94XgywQGehSL6y6U_JJws9wOkT8dUPg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 22 Dec 2021 14:51:37 +0530
Message-ID: <CAAhSdy04d5hbFLArjkZiyc4M58bXtbj5ezR25SB697M3yhUfcg@mail.gmail.com>
Subject: Re: [PATCH v5 13/23] target/riscv: Implement AIA mtopi, stopi, and
 vstopi CSRs
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42c;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 22 Dec 2021 09:21:53 -0000

On Tue, Dec 21, 2021 at 12:18 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Dec 11, 2021 at 2:34 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The AIA specification introduces new [m|s|vs]topi CSRs for
> > reporting pending local IRQ number and associated IRQ priority.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/csr.c | 155 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 155 insertions(+)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 4b3edc1043..6f613d182d 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -189,6 +189,15 @@ static int smode32(CPURISCVState *env, int csrno)
> >      return smode(env, csrno);
> >  }
> >
> > +static int aia_smode(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smode(env, csrno);
> > +}
> > +
> >  static int aia_smode32(CPURISCVState *env, int csrno)
> >  {
> >      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> > @@ -833,6 +842,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
> >      return ret;
> >  }
> >
> > +static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    int irq;
> > +    uint8_t iprio;
> > +
> > +    irq = riscv_cpu_mirq_pending(env);
> > +    if (irq <= 0 || irq > 63) {
> > +       *val = 0;
> > +    } else {
> > +       iprio = env->miprio[irq];
> > +       if (!iprio) {
> > +           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
> > +               iprio = IPRIO_MMAXIPRIO;
> > +           }
> > +       }
> > +       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
> > +       *val |= iprio;
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException read_mtvec(CPURISCVState *env, int csrno,
> >                                   target_ulong *val)
> >  {
> > @@ -1362,6 +1393,121 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
> > +{
> > +    int irq, ret;
> > +    target_ulong topei;
> > +    uint64_t vseip, vsgein;
> > +    uint32_t iid, iprio, hviid, hviprio, gein;
> > +#define VSTOPI_NUM_SRCS 5
>
> This should be defined at the top of the file.

Okay, I will update.

Regards,
Anup

>
> Alistair

