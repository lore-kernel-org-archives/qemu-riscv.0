Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2723CD6E55
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:19:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtB4-00018r-Nm; Sun, 31 May 2026 23:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtAy-00017e-B9
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:18:52 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtAw-0008Qy-Lq
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:18:52 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-68bfcf11050so4492798a12.0
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780283928; cv=none;
 d=google.com; s=arc-20240605;
 b=iVithveBUp1fAXyrVcwWnCw4pcN5LsQSeO21FycQXJ3IbVVFOA5FpfOrD8kRuquU3a
 9kRUd+cqgapxlee184k4WXBmBKhaemWHs97pscjzF6BgcQVLRkurowkb4mf9O9z0fwft
 vGye+dWtAgTxSgF08Ybig7HzIyJAcmdo1eW0D2/5nWIo/CixV7Qk5ho0TxtiYgbASbKe
 tyk7cSr8ttmPwqZyUBl9OzW9eGh5lxt/7T0oOgK81L/NbZVkR/u/wYdmhC71QX5jmzFL
 QS3oA30NCq4Get3+/1hZw+ZY2Ngey/3DnDb+pMNoCJmlKvc57wVumed2XfDviAfiCBKi
 iICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZYbT2BfM+E2WrII7NZWnao+oh21andYNC8XR6r7/ckg=;
 fh=CqxQdM5OH19ijC++meQ2uk3XS1cp2oaTgZylXu28GlI=;
 b=P6ft+UUv7lfVLkrgm2kjg4BE0AYSRSWwssrKIpbK4fcUSOtOy4cFeFSFn3Uu6PEf8C
 XlAY5aeekSd8F4xtVzSmnbjuORT5Qmk6yYTPdsQwldEcc7jhA+qTCGNe6z+EdMBRBAkw
 j+hnzj/7CChux//cR3jbc3VtBzcwms9Che5mMZH4IBEb3I3ys0+YhjHbimeI8rukC0VS
 cQHrh3O6kXHD6H9PPN5O0c+Mlbfar2CHoHxPl4ed3IOKq/7QLRpjLnzSikj019naHjNp
 4ijjDcq7vnPmU8wbfTKCTADY6Xp8CzolZOUjfPH7GfZj0zWdICCKhpeEVOf8bxbIHdxH
 +YMA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780283928; x=1780888728; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZYbT2BfM+E2WrII7NZWnao+oh21andYNC8XR6r7/ckg=;
 b=d5QC7TGIHLycEBfbUmIdDcGPqXHLcSu1l4JRvzLvA0lSE2b0GJHuiauH6BHIyJxzNr
 DS2g+yR6OVrg8pVpatIk/A75Fuc8nUJcIDFWy0LLpU66nEMFZjt/9tLG+5n1wszUyiEd
 BHM+4ieEreThNXzus3P4t99+KC5u86BTXkCPzmUqi/uFvTtcCwa0dyKokzuzeQW2okfa
 aqnaTBMiKuBZKL+qggMHsFvuTlXnFfG0eQAu9PvUCFI+aJZNRAKa3uz75zGRGkKrMz07
 f6364oGBHTQLVd58xjtiu5ra0dpIZyq0mXOaj6HHOepAiGmgNDoeKrt9b7LlVb9Td08H
 P0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780283928; x=1780888728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZYbT2BfM+E2WrII7NZWnao+oh21andYNC8XR6r7/ckg=;
 b=L/67beQnX5ubUO3Y6oflm1iEzA0Y8ZoE26pGaHl4F7GuXnqWvx/QjKt6zzdW4Jkiiw
 GVYAMF3gozzHVbjFKxYbxK/Lm9qinw8cY5GwyvjOW/O8u5xL1ODXWuY7rCnPRm6WLFLk
 DyxdN4KUk7VfXHj9wExslMk9j+jISCPy2k4xyUZa1fS7wCczeK/N+bbaogmNwzljVtDB
 nnJmNl30tBaZe5K76pB8O7WY1YHElJyLcf0d+13tx8tw0//jJ095QjzD4h4YNP+2LiUI
 FsYVKXKadDJpAU2td43e/AmrnP80lvb0zpUgQgSua0dyhDtPhs0218z3LAdZNJckzSqb
 yQtQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8GnNbOtI5M25jcK/iaOfyKsgUIGxLir51ZUKokI9gf63B/Ax6Ly8iq+MNLmNFxL0syQi3IgyCIwjaS@nongnu.org
X-Gm-Message-State: AOJu0YyMlwzmxRN5bQ34el10gpDIyxv99IqtUhxoceAbmE086BhtUsWJ
 ffgB3uEK4S56Am99KRt2BNHV2qeZNAo2YzLxai6wBbg5/EIN607QNEvVrTV+g5ROaQtNdZjptMI
 g69FLj0GNyCIqZW4sBGviF6TVCvEqDL4=
X-Gm-Gg: Acq92OEoirkB1wBliGFL6oZ+VFhfKb6ZZ1xUjpDCMJ4EUylDqyFT83h5pI2H302+zLk
 +hkjAyYocBPQ6BRm4Iow2W3j+0xtp9ni2wfSqm2wRwMOirrto3fwSyNNtX6XYIexPjAvCnLMZop
 akMvRM/Vg3G7IFOjd5YxHCtc00dYIv8P1dzuaxbLcJwDzAJEZ50N3W8tQWH6eb5/gOSXhfIEobp
 cuNCrKcpWxZ+BfQ4e1EMcnwDPAwsrluTOAUipbsFNDEC+cqGlgqOjMq5NoLqmxKsqn4GbWJaGVb
 4PFrx+J2BjMDNzFw0sUlRkwqe/51JoaHnJj1XGhpeOTvb8d+
X-Received: by 2002:a17:907:d9e:b0:bce:80db:77ef with SMTP id
 a640c23a62f3a-beab3852a00mr466063466b.43.1780283927934; Sun, 31 May 2026
 20:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241231032654.133039-1-frank.chang@sifive.com>
 <20241231032654.133039-3-frank.chang@sifive.com>
 <CAKmqyKNvZQ2XEAgwCDpOHVfV_NPnmMBD+ZV2q5dRAhoaKcpvug@mail.gmail.com>
 <CAE_xrPh=Bcq8f3Jho0tcZWzJ4zxrNuKPtONW7fgKAvKKadOzCg@mail.gmail.com>
In-Reply-To: <CAE_xrPh=Bcq8f3Jho0tcZWzJ4zxrNuKPtONW7fgKAvKKadOzCg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:18:21 +1000
X-Gm-Features: AVHnY4JSwS-sxDAPxTIVn-HbPl8nQo4mTv5CDW05WTTloJ0GCSCKdF-Eh5jLHng
Message-ID: <CAKmqyKNsiNr8rdrOr4c0n64p+k8GR-8mjdhm3vBredWknOERUw@mail.gmail.com>
Subject: Re: [PATCH v11 2/6] target/riscv: Add Smrnmi CSRs
To: Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tommy Wu <tommy.wu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, May 27, 2026 at 6:23=E2=80=AFPM Frank Chang <frank.chang@sifive.com=
> wrote:
>
> Hi Alistair,
>
> On Wed, May 27, 2026 at 8:57=E2=80=AFAM Alistair Francis <alistair23@gmai=
l.com> wrote:
>>
>> On Tue, Dec 31, 2024 at 1:28=E2=80=AFPM <frank.chang@sifive.com> wrote:
>> >
>> > From: Tommy Wu <tommy.wu@sifive.com>
>> >
>> > The Smrnmi extension adds the 'mnscratch', 'mnepc', 'mncause',
>> > 'mnstatus' CSRs.
>> >
>> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> > ---
>> >  target/riscv/cpu.c      |  5 +++
>> >  target/riscv/cpu.h      |  7 ++++
>> >  target/riscv/cpu_bits.h | 11 ++++++
>> >  target/riscv/csr.c      | 82 ++++++++++++++++++++++++++++++++++++++++=
+
>> >  4 files changed, 105 insertions(+)
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index 58bb5196a8..c5d5c2f7df 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -1127,6 +1127,11 @@ static void riscv_cpu_reset_hold(Object *obj, R=
esetType type)
>> >          riscv_trigger_reset_hold(env);
>> >      }
>> >
>> > +    if (cpu->cfg.ext_smrnmi) {
>> > +        env->rnmip =3D 0;
>> > +        env->mnstatus =3D set_field(env->mnstatus, MNSTATUS_NMIE, fal=
se);
>> > +    }
>> > +
>> >      if (kvm_enabled()) {
>> >          kvm_riscv_reset_vcpu(cpu);
>> >      }
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index 284b112821..a2cb471b3c 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -486,6 +486,13 @@ struct CPUArchState {
>> >      uint64_t kvm_timer_state;
>> >      uint64_t kvm_timer_frequency;
>> >  #endif /* CONFIG_KVM */
>> > +
>> > +    /* RNMI */
>> > +    target_ulong mnscratch;
>> > +    target_ulong mnepc;
>> > +    target_ulong mncause; /* mncause without bit XLEN-1 set to 1 */
>> > +    target_ulong mnstatus;
>> > +    target_ulong rnmip;
>>
>> These have been added to the wrong part of the struct, they should be
>> above the comment
>>
>> /* Fields from here on are preserved across CPU reset. */
>>
>> Can you fix this up please?
>
>
> Sure, I can submit a patchset to move these fields above this line.
>
> BTW, do we have a plan to support resetting the registers on CPU reset, s=
imilar to other architectures?
> E.g., For ARM, it has struct {} end_reset_fields, and the registers are r=
eset to 0 on CPU reset:
> https://github.com/qemu/qemu/blob/master/target/arm/cpu.c#L320

I don't have plans, but that is a good idea. Patches welcome :)

Alistair

