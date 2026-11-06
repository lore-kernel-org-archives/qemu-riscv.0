Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675FB606A329
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 19:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3ovdv77
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xPPMq-0003yw-Li; Fri, 06 Nov 2026 14:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xPPMk-0003wi-Kl
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 14:12:46 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xPPMj-0008K9-2N
 for qemu-riscv@nongnu.org; Fri, 06 Nov 2026 14:12:46 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6b566cf56c1so1086811a12.2
 for <qemu-riscv@nongnu.org>; Fri, 06 Nov 2026 11:12:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793992363; cv=none;
 d=google.com; s=arc-20260327;
 b=AW0N38apMVxtgVPLh0k3bbeQNZ+ig3Y3tX+GX9U2ousVROwCYzllNhauct7nEGbZGp
 RIUeSEtwewEGwXmj9Cla8fsax4pUG3/o1IkkB66GvUTx1HGCPH/cv0Pg0WfhxwfeyO/e
 CrDYBiR1Bz90d34S70zuftG97M79RJA+Rz9Luvq3OUvk6QkiTWXsSW8nBhnG3gUCiA37
 AiCfhd9M0KQq4gT08ngVit/6HCvku78wY8Xn+rWVKldI+wE38of6pVpcAYrx1kYJcqzw
 olt71udOa3hsyjMenzZFKZeukgnjFM9xlUfekgeEJLWT6+IZdPLe8kRv549tG950EJRJ
 2lSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=m321WU9WR4Fb0rnxQ5BSk67u7RgHUDMKKV6e02IQ/pM=;
 fh=T8J2xQsJYMk/h5CchGI2GVD9gk190CMPsBRfPPL73RI=;
 b=HYVGu+3tBpZCGo+5Vi2wDwm6mQbouT7rgcY9Qyb2li1eCwn8/EeZOTPbDfUv1Q8TGJ
 24WlgCY3avlTkhsOVWYZOuXHOAWdJi9tAwoQvMc6uVhDI6AER8drmQWKpor3Tbmezgei
 xIfyZmmPD49vtdusxO23FadJFY1wgijh4/846ZkmKRVS793/b1d5k/dWCiTD4xw6jLcZ
 j6hldueujnHlUDu5fcL/x4qYRgwMjJzEMTPLKku3xORzAvhuFstcB6QUnL2Q6IyNM+Fx
 GO2GQgJgLBUEPDhRz3eiufuEdR8sK5LehKlv5OzTiF2n7occdfI2sS3eUXK522sLjl/O
 hrVw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992363; x=1794597163; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=m321WU9WR4Fb0rnxQ5BSk67u7RgHUDMKKV6e02IQ/pM=;
 b=h3ovdv77yNtVmO0t9Lvcb/6xQwZzER4vbVU8Phc0WTRowIhbQqgUbWzIFCM0O1mp9R
 IQGjd76liEegLe35BPusdad3FiK31IP6Fp+GOpNsWRy/1Cj0P7C7Rg+hTuczVQ7Q2Xf/
 mraoEjTC3OeQwRAeP3fYLKBqKZabesJlLHWCMHJqgE8G87hbPtW69fBHGGS3S5T4fCQs
 t9o+clNsOVBcWehUcysuZ7nbUQOQy/gxv6bjowf9vgBHYEjjdrelRdL2oRa7EasrDfOU
 6devp6BZ9bi/4W9N4hcRQhIESOgsT3QhAjilRGD5wIJNN2ODML5CHDqB6w3CApJPKjwv
 MDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992363; x=1794597163;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=m321WU9WR4Fb0rnxQ5BSk67u7RgHUDMKKV6e02IQ/pM=;
 b=O725bfhAm8Svt7aAtdo1X624StQMkeSgKz1Qd2cm7QEx0thpXuxyvR1GwEF8Kcx7um
 earg2O7fWTyMWrvaygtKa/JUNklQ5p1Arwsq1IJ+UH3UzDPG1tIiJq2xP3rFZCaEWHg4
 iElly97nOz7V3Nh+9XNAkZnO1cU6uWm47uC6wxrViV6ovR4/i/Y4yHzomeJBnGfZ+5ao
 I+j4cC+tR4UAnKcopqd3mSx7uNZJAdLaHgDZFcsH663O6ZzXmsYj8i74o1+Ilwhd0cdT
 vcnEhRB2VAm1AMo/4ilZt7moRFWuIVQZAk2fLEB195OIW6i0aRUSuIEEoEME8rJKb9JO
 dTmA==
X-Forwarded-Encrypted: i=1;
 AL+hErF79FPa/UluO7b0FfrmDwg62zGEAc/VkfxlcCU0K8YCsG7krtMZAjQCBjP+3QfZV7HaM6i2K7KFs32x@nongnu.org
X-Gm-Message-State: APuU4Z+xmQ8ddIWEANgy6ypgdZ3csINX5LdpgW7aGUkMZ7N5pcIXdrKt
 Nx6IqKdZRKXIX5JTA0EC+AXJVgQ2NN/cvs1ys/5+GIvOUVK15p1yOcKVW/12tSqWa05qxa7A5bI
 eW/lncEQMi2+XJdDjVsmdeG8FLr2A2NQ=
X-Gm-Gg: AYBFou30Gv254pgZP9REoVEcbJoJpJk5iD/HxuLIeVJkdcPPlZsRNp/PDNU6gjcT6O3
 FJU28w4BeB0Tbt1xwhF9hmOpUD2UUDuCX0DP3EkKc5s2Wyh4depRKdMsPbd7q7GI/xoa7UaWDXv
 fRYR62zO7TY6aptiD4XOAFn+lkCUNcsTcG9/V0UVYp2++QYTRjFk0IOiDLL5jGzque2xiOozno4
 4cIMaeXE11k6C4ZbbpMAfJVetgpkAWetmScrjLW45CNL7BsLmnky4T22RY/8BNh+ijVOv/pZn/K
 te1wO3qR2sKyydMRCk5xiYNw/fFe7GISJvSJm+PPs6DbzlQ5NeLGFpa1EG4MamuLUFKJBkyshdw
 dYn4/zmEvjGRqHJbqi33cFJHsNPbFOCp6PkP8
X-Received: by 2002:a05:6402:1493:b0:6b5:7140:e2f9 with SMTP id
 4fb4d7f45d1cf-6b59781b3demr1886061a12.33.1793992363374; Fri, 06 Nov 2026
 11:12:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106023936.772-1-luoyonggang@gmail.com>
 <20261106023936.772-2-luoyonggang@gmail.com>
 <a97b0f72-fb7c-4f5a-bde6-b542056d6e5d@oss.qualcomm.com>
In-Reply-To: <a97b0f72-fb7c-4f5a-bde6-b542056d6e5d@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 7 Nov 2026 03:12:30 +0800
X-Gm-Features: AclHuK9JM5gWspep-JUsvI5KqyyfhEj_r6dk2NPt2HXBj4Q8sVBSRKgEREL75uE
Message-ID: <CAE2XoE-RxH8AOhJJXNG9d8XvGbjtUQQ9byfZschZ=fD+3rrv2Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] accel: register CPU parent only for AccelCPU
 subclasses
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Chao Liu <chao.liu@processmission.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>, Philippe Mathieu-Daude <philmd@mailo.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 7, 2026 at 1:59=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 11/5/2026 6:39 PM, Yonggang Luo wrote:
> > accel_cpu_register_type() creates the abstract parent
> > accel-<cpu type>. A subclass names that parent, and
> > type_initialize() aborts when the parent is missing. The old
> > type_init registered only target_cpu_type(), which is one name
> > in a multi-target process. Call the helper from the CPU type
> > init of each target that has an AccelCPU subclass.
> >
> > ARM calls it because whpx-common.c parents accel-arm-cpu on
> > aarch64-softmmu. i386 calls it for TCG, KVM, HVF, NVMM, and
> > MSHV. i386-softmmu and x86_64-softmmu each pass their own
> > CPU_RESOLVING_TYPE, so WHPX on x86_64-softmmu finds
> > accel-x86_64-cpu. RISC-V calls it for TCG and KVM. PowerPC
> > calls it for KVM.
> >
> > Other targets have no AccelCPU subclass. Machine init looks up
> > tcg-accel-<cpu type> or kvm-accel-<cpu type> and skips a missing
> > class, so those targets do not need the parent.
> >
> > No extra tests is needed, as these QOM types already be
> > tested by the existing logic instantiating all QOM types.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  accel/accel-common.c      | 6 ++----
> >  include/accel/accel-cpu.h | 2 ++
> >  target/arm/cpu.c          | 2 ++
> >  target/i386/cpu.c         | 2 ++
> >  target/ppc/cpu_init.c     | 2 ++
> >  target/riscv/cpu.c        | 8 ++++++++
> >  6 files changed, 18 insertions(+), 4 deletions(-)
> >
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Tested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


Thanks for your good review, otherwise it won't be in such good shape.

>
> Regards,
> Pierrick



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

