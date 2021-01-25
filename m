Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3zQQ-0004zu-Mj
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 05:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3zQN-0004xu-AL; Mon, 25 Jan 2021 05:48:47 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:41149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3zQK-00064d-Lq; Mon, 25 Jan 2021 05:48:46 -0500
Received: by mail-yb1-xb35.google.com with SMTP id p185so12862104ybg.8;
 Mon, 25 Jan 2021 02:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8JNZ2aNKgPd0EHCcouZDvQZGX/aNz8I3vbpjCMmsDn8=;
 b=eXeazLk7T+mY7nTcfEAZHGBu/FSGFZuk1a2CoGm9O0g3UzY1BBDgFvKW2mXcYzA+T4
 0eUKyoqFPLSxphieXFVBVxkE2OZd89P0Zf6oXnwwtkPv9yXutFFQ/Qh1bAIPkj1ArfMm
 SZs6YgbbcvBab/fJstQRT0650C/Xd6C3EbPG6HJmY8wwv/9PqpvKHHcp30K20IiaCdom
 n0W2KNaRcRplbZuHzI0V0Wq5fIyHKIL3sZ58IQ1440kOOudQqhtrTGnWb6KMDND0oOAR
 /DND4PC7JK4gFo/tuWTyLdZw8DFLsoiX3+nzd49fTNNspSH2Nx2pd6dViBk9lmseoskG
 B3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8JNZ2aNKgPd0EHCcouZDvQZGX/aNz8I3vbpjCMmsDn8=;
 b=YKfvF9Lmg8HmHm3k23II5l5kWssUUzSyvlPw9fHXxunxo6WSnhZEDbBCk0C2OqYzie
 OoLjxcmquU6+bYbuKA2vIq5SFJEKdX0Sb6/fM8UgY1Q0O1u3vapoaRuSIormFtO3QB0e
 XbV7seG5gY1IXcvHliwyWJGTrIqdAqaB1HjaWKFUd1WT6ht+4B0MUTy5zfhjkfrWHYpq
 zkWfOTiL9J5scMPC7O6ccUrWSVVSgsToL/xze6n9zOkarB6b3i0R00QjHYUZJkpRNB6v
 aXppVVRU6QW7bZIve62Evk4KucjowVSp/SfaXx+J5WFg7r7YN2kFFFnvce/cIQ6iv9Q4
 kbyQ==
X-Gm-Message-State: AOAM533SP/KC+eWRQnYZZa5+gDRstmOVP7KAIPaWJnAjcKkmGRwjNECS
 NMmG+TaID5ohFjItFKRrm49EySXkVfP2xGc9ZHE=
X-Google-Smtp-Source: ABdhPJx23tDPxC5YYzsjbbZZvP1Vmx7LpoFCWYCZxMvtSD82HHHOUBV3k3mzKlBjSJC3uHpNTbiK/DAsV/KeUK+fQEI=
X-Received: by 2002:a25:2041:: with SMTP id g62mr1106734ybg.152.1611571722623; 
 Mon, 25 Jan 2021 02:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-19-bmeng.cn@gmail.com>
 <634d629a-999d-b1e2-28dc-f9b49f9918a7@amsat.org>
 <CAEUhbmVaeMeOcACyKg7q6dHVn+Pue7eKzu0RW7mGx5PQyVWg=g@mail.gmail.com>
 <20210125104106.GC2925@work-vm>
In-Reply-To: <20210125104106.GC2925@work-vm>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 25 Jan 2021 18:48:31 +0800
Message-ID: <CAEUhbmVKywZqhr0pPfQ99YoFtOJz3MAocqx7RugnG2r2dZMPwg@mail.gmail.com>
Subject: Re: [PATCH v2 18/25] hw/sd: ssi-sd: Bump up version ids of
 VMStateDescription
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Mon, 25 Jan 2021 10:48:47 -0000

On Mon, Jan 25, 2021 at 6:41 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Bin Meng (bmeng.cn@gmail.com) wrote:
> > On Mon, Jan 25, 2021 at 12:59 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> > >
> > > On 1/23/21 11:40 AM, Bin Meng wrote:
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > With all these fixes and improvements, there is no way for the
> > > > VMStateDescription to keep backward compatibility. We will have
> > > > to bump up version ids.
> > >
> > > Unfortunately this breaks bisectability (think about downstream
> > > distributions cherry-picking patches individually).
> > >
> > > I don't think there is a problem increasing 2 -> 3 -> 4 -> 5
> > > (Cc'ed David in case). Could you respin increasing the version
> > > on each VMState change?
> > >
> >
> > I definitely could be wrong, the reason I posted a single patch to
> > upreve the version is that, I was under an impression that in each big
> > release (like here 5.2.0 -> 6.0.0), the incompatibility version id
> > should be bumped up once.
> > It does not look correct to me that in a big release we bump up the
> > version id for 10 times.
>
> I think I agree; I don't think we've ever done it incrementally like
> that before.
>

Thanks David.

> It would only break bisectability if you were cross-version migrating
> during the bisect which is rare.
>
> > Since this is a series to fix issues in the ssi-sd, I don't think it's
> > practical for downstream to just cherry-pick some commits while
> > leaving some other commits there.
>
> Never underestimate downstream :-)
> However, please add a comment when you're doing incrimentals like this -
> e.g. a TODO or something showing that it's unfinished and you need the
> remaining patches so people don't do it accidentally.
>

Sure, next time :)

Philippe, I guess we will need to hold on your PR?
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D226135

Regards,
Bin

