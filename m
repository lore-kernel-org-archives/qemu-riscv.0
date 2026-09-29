Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA6BCA5FA1
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 05:28:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBQNb-0005Ag-9l; Tue, 29 Sep 2026 01:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBQNV-00059j-VI
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 01:27:46 -0400
Received: from mail-ed2-x0d.google.com ([2a00:1450:4864:33::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBQNS-0001g3-Lq
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 01:27:45 -0400
Received: by mail-ed2-x0d.google.com with SMTP id
 4fb4d7f45d1cf-6abe19c4262so3087888a12.3
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 22:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790659660; cv=none;
 d=google.com; s=arc-20260327;
 b=i+QKh3rweNZjaH+2j80Uwb33NmNV0XjTSp0HZlVkhdpNNP89dvgN9fa2TgOfaotxTL
 /eDLF/tx/F9jgsm2QMWeeR1Kp3f9Wec/FgXEfFPYPYDZ8GedP9aApNKCoEvT0i2brou7
 hdjFVeFVK1iWZkF6i8xCVTnhpyYDzEC8F9U+Gvi4bIIfq4y1JunIjK5gk+4lbmHHN56Y
 r3HqKXjfXqsfNksNV9pNyx9hiPzpfitxZ4IMdGhtDagrcIglPgOIyPWbcCoKvjfV2iD2
 /1XIHQGhtQymPw668ZVOe7TWHgloUsCx6AztU1xhacQTnTD1/hELH2xXuY08fjx31tw0
 2lcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=PdxkyoUwRHMcuj5cA6kh5ou3VZP2g/6ztdUBPFZW3x4=;
 fh=IK3+BO97g9r/VVI4A0yVddzDCqQA5mluMCZo1wvwd9I=;
 b=fbZN3Aaine1WBGaJc/2SlqJZ5eQE6/zHup5r952ifcxvfH3A+dwc1TKRMNF5DlHk2p
 pUnHLcckSaIyVP9MMq74qJOtgzGZYmSrQTQixPhF4XjfSDrS5nEpOyigpwazOlIfFRW/
 RMxTPgZzKjkbVrO/Dmj+f+stgFL4YKooGUR63EDgbUEYsuTFD4f8yDoBwcaJgkvOr2gd
 vYEkNce7ecjk3cKbNfjHDqnKdZJP8EgxpDNCQbBxgfVdzQZ8R6j84ZqnZGrvaFiNSoJx
 I/inngE7ft1GqRruQHLtEeq+xl8L7VaVZaMEvhDbB08oDj9dpRWJpB434jud8ZJj6jtx
 ePYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790659660; x=1791264460; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=PdxkyoUwRHMcuj5cA6kh5ou3VZP2g/6ztdUBPFZW3x4=;
 b=m+3Xuzj5gK79A+zUdMZeC07knsp/LLfF2k6UXkh32KV2FVOpnw2IFL1SYvDAJhWOA3
 vwqP+PaG/GYYfgM87wnl/tIyY2CSydH1adPb6aTtAAGEiA0JRUTxuOuOhWvcVUN0b3YZ
 bjffQQzQK+Wn8HTzfiX/vxixH0vKZwAnY1FTBwYaB/DBoJlePr5GbH3Hzeghw0b1dNZm
 6TJBP+MdfmX0BNwpAX3gGOQm/D1Zy/cNchj78ySXx3WMzVhKK5aMcm8EzkTM4rBqfFzQ
 zuLoCBFK//rR0tQG/6WlnTP1i3JVDFnqr2jFl1mYvXkh4qVPo11qtCbCPMbxoq5S8XuF
 2giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790659660; x=1791264460;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PdxkyoUwRHMcuj5cA6kh5ou3VZP2g/6ztdUBPFZW3x4=;
 b=LLH9xuiJMzZVRgidots4A24uNnA62f0S0lpewTi0IMFMI/SkGo5XWcmlFJxtF9WsvO
 a8yBRukPy0hAwyq8qhTAEJVXkLyTCtaMvDRf2XpgvJ67xFWZuvb3BuqNYTruATHPvpEa
 l4ZGeE+gCKzlPs0ByMZbudmnZaHXx2nL6SHYcVwF0tgLI1NQxHsQPbBZ5HHSG8haITGe
 lrYUs7RmYAOQDBZGSYnYdQ3YAbNPEGbDp+Ib9NkBJEmVslhPlve4qhTjZ/TszlBkSFz7
 z/ad1HOpKnX4UfrCambYzI4NrXmSUUtYF8QeBuqyyBMWFRWuVvUp1wOSF4brHS7V5kWB
 yzpA==
X-Forwarded-Encrypted: i=1;
 AKwUvByor4VQsuZYthgQR20NfrskGzANfzagIfZPhUFj2P1sqKHkSf8SUY02wF9uDMaQtxcxxuKu2GD8+zfr@nongnu.org
X-Gm-Message-State: AFq9FYLRwkHe4RT9dAvaFaBXD2/PWntHsXn5JZeMk/eBBnWMBibOO9dQ
 RMTldXvJDZAOkHPb6buDAiKkPCBltSgZgpi66yw3i4I9t14S8uoVpr5bYdqE+jwxThcwn5Ugetm
 QU0QUIaMblC0sGec7JtfURJsPD/O43Hc=
X-Gm-Gg: AYBFou0MshDIY8n6K3L6RL9/SIpqxf2XHmueu1AyrND+nzUI29YUleakOIFq8anNjc8
 H5ivgBLXitGwkhbuYcDSsPnbqf61qN+foEt0pJRXiUjqF7xOgA7XxX89KD9jIjzZaP8mwc563oI
 UVGNOU7K4yW22JuHovlf4qoMjsLYazU2wWCAzwKlCEfFw0WTXxzMQV5ln7jDGglLR40M8hDfOVX
 fYvScD+R0i1AFtSsDzCaujyZlBovKHJsV6wvCjY4qf0JeIoTLYqRYV9IjmuKgMVMGpD1+xu/E5Z
 3tVwGBrmfNzpRfvfAaDfq1i2c9q3MZzzE/w/Vqye1f/HcyGn8lcSjx/3cnqSSbXIAg==
X-Received: by 2002:a05:6402:52c5:b0:6ac:a828:c0cc with SMTP id
 4fb4d7f45d1cf-6aca828ca1fmr947344a12.4.1790659659802; Mon, 28 Sep 2026
 22:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260928052051.251-1-luoyonggang@gmail.com>
 <20260928052051.251-3-luoyonggang@gmail.com>
 <c7aadc02-6c5e-4ca1-875c-43050305f4ec@oss.qualcomm.com>
In-Reply-To: <c7aadc02-6c5e-4ca1-875c-43050305f4ec@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 29 Sep 2026 13:27:26 +0800
X-Gm-Features: AclHuK83mWUX3RGbqD-ktRjJRZCuxXxXzLoRrN05Zufmu_RW4xpD4Ai-lcwFtuw
Message-ID: <CAE2XoE9OxNnrtbtsBwchQ907KERJYuVcCeXBu+awWdgVLpWxxg@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] accel/tcg: add cpu_loop_exit_excp
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Chao Liu <chao.liu@processmission.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, 
 Glenn Miles <milesg@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, 
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Sep 29, 2026 at 1:23=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 28/9/26 07:20, Yonggang Luo wrote:
> > Add cpu_loop_exit_excp next to cpu_loop_exit_restore. Set
> > cpu->exception_index, then restore and exit the current TB the same
> > way as cpu_loop_exit_restore.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >   accel/tcg/cpu-exec-common.c  |  6 ++++++
> >   include/accel/tcg/cpu-loop.h | 12 ++++++++++++
> >   2 files changed, 18 insertions(+)
> >
> > diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> > index d20cece1c5f..31fed8e497f 100644
> > --- a/accel/tcg/cpu-exec-common.c
> > +++ b/accel/tcg/cpu-exec-common.c
> > @@ -118,6 +118,12 @@ void cpu_loop_exit_restore(CPUState *cpu, uintptr_=
t pc)
> >       cpu_loop_exit(cpu);
> >   }
> >
> > +void cpu_loop_exit_excp(CPUState *cpu, int exception_index, uintptr_t =
pc)
> > +{
> > +    cpu->exception_index =3D exception_index;
> > +    cpu_loop_exit_restore(cpu, pc);
> > +}
> > +
> >   void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
> >   {
> >       /* Prevent looping if already executing in a serial context. */
> > diff --git a/include/accel/tcg/cpu-loop.h b/include/accel/tcg/cpu-loop.=
h
> > index f4d38bc2bca..856091020f2 100644
> > --- a/include/accel/tcg/cpu-loop.h
> > +++ b/include/accel/tcg/cpu-loop.h
> > @@ -65,6 +65,18 @@ G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
> >   G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t host_p=
c);
> >   G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t host_pc=
);
> >
> > +/**
> > + * cpu_loop_exit_excp:
> > + * @cpu: the cpu context
> > + * @exception_index: EXCP_* or target trap number
> > + * @host_pc: the host pc within the translation
>
> I'm not comfortable this is hidding the 'restore' part,
> not even mentioning no restore is done if host_pc=3D=3D0.


So it's the pitfall of cpu_loop_exit_restore. what would be
better, I have no idea how to improve it.

>
> > + *
> > + * Set cpu->exception_index and exit the current TB, restoring
> > + * guest state from @host_pc the same way as cpu_loop_exit_restore.
> > + */
> > +G_NORETURN void cpu_loop_exit_excp(CPUState *cpu, int exception_index,
> > +                                   uintptr_t host_pc);
> > +
> >   /**
> >    * cpu_loop_exit:
> >    * @cpu: the cpu context
>


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

