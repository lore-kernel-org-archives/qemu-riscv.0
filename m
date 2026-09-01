Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A30DC61DD6
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 15:28:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1QPf-0007Vh-C5; Tue, 01 Sep 2026 11:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QPd-0007UG-I4
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:28:37 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QPa-0001dw-Fy
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:28:37 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-836c8bde2dcso893487b3.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 08:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276509; cv=none;
 d=google.com; s=arc-20260327;
 b=ORC4X0u5PoVlzp7krn8cnvWc6fCqY4UKXiKV9pDkBoXBuPIH6a4E2JtsOMyf50yI8h
 28HzAx6ofl4okg4qi4VpskNGVKabR/pivEoDOPP8GAWaLrVnSm02v0346CQewkeO5/Yd
 OQ9SOQHDfZIb4CqdnZNc4iKES2dzL9ZetjlZj+71NXCdf0+cLNkmKDmGJcwjT6FQ+/52
 mzUfz//trwN5zVEYxhieeXZsTeBC3QiELDYmceL0PP9dLvbBXPLcNk4SxXwaCuCJiBKc
 XUhgX0RsZY63N2CfvVTG3Vso2Civdorp1zFSuSFG3RDxmy7aR1PE/6OFFNODiIL5b43f
 EKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Shgzb5eJJo9lYhjmGyOmo/iUM2L9WckXZSOG7+edZvU=;
 fh=370h9SlrlR0nEmsZTxYNBWqSpZ/5n3Ibl0uLgyneyjA=;
 b=VTHSnjuRqQ7M5bU4uRe9lrpEeqqt0+et0Qr6ZU7NIMJrLXfyMAIQ8jeKN2D6FvqMLz
 5MnZamMPnVeRj/fvkngMI/022jxIr5QcY+Z1PmR01Qn4rFRYDNBW+6F4JSQksxpIfsGP
 A9CKX6E0WpfjJ2KHqYjJ75Iygn9aElQz2PBJB7dcfe7d/9UwhSBOuued1e1kBzX5nqjw
 aUmzpgY5DRc8oZwvnMP63rZ33O7tr0DH6mcZhmjHgzZOWJNKEE/00bS+XVGQuZRMpXAZ
 CezHggh5e5yrVA55vQtUYHq0x+HVma1byX7wBwS5lJ8SvIpnxBQ0KYnX6HxI4pgaqjMB
 9fAA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788276509; x=1788881309; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Shgzb5eJJo9lYhjmGyOmo/iUM2L9WckXZSOG7+edZvU=;
 b=q9ro7nLSFpVxtH09KRqlgbIk1HGpNWhW3aTVnLybjzjGSMMZhK+z45dmqi/8oJuUk6
 JvLqw1WexCOU1sTfUNUZLdmmIN1iXqOgH26J5IbOb5J+Z9A/js26s9ljswdI71UgXnNZ
 PLOnmDUMU7o7gKVgu+jpBpwlCG51/V9brCaPcMhV+LqsPnyT8Iw1m0lcUo8oblF2R0x2
 q62wSVO7UDJ1rYOgMg7ol7U+FBaYa+5gqVF/QLEIh32j2QRC3ltgUhUUJTdn0pqRYein
 XoyhnyouUqTwCYun0U0erRxtx+rPrya3hzHiuzYEfXyrIZuVg+UR9stQLer/kCyHN2VB
 46pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788276509; x=1788881309;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Shgzb5eJJo9lYhjmGyOmo/iUM2L9WckXZSOG7+edZvU=;
 b=XXTZVMdP2lOLYh11Sa6bsBpYoqzGU3kNnIS3VujnEaBorKlLYp1R8PB0BWpyO9fgJs
 IUUUSLgq/7HZms8WUF1pbRQ45M8lzJvNGVv2NE/AFAZ58PUxRvv6fkjT95cRfQQJRazX
 jd0zIGGeGDjRpfL2NuP7/HCTuyM9zM/LW9Hi2IhNnvU88tWGHFknOOir1Ax2xQV3o9QW
 0F7kv5vWHdxYsZlVOlal3O+vBNI5ZBuuMoTEcVEK3UBMpIKV4XqjtQxwgUk10/ZsVZ/9
 fDHjCF9kCbm1Wk3+2AjwunP6Sqn8N2vXoyXfn0e3/rTcUUHabtSzIcFdNqiNUH06nb6n
 MHGQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxt//b4QMOgfQCJnjrhUFsACocRGOPRnlRUL9i1mL3MGvm4kn3dAWlHij1Ue8B005yTJvHgmedw/iue@nongnu.org
X-Gm-Message-State: AFuF++lxvUxpy5r4y9xPea0sJ6qIzPmcTjDfNReBy07Nu478LnKOvcUu
 IXQy6mHZ/BQ30m+JQ0ZXpt3STG14vvF+EmVN43gG4Oec8GICv4/qdFYdQM1dOerM6wMQOKDFceU
 VusPrziwoAwCBhghjBgGQtHt3onGqvXJhc6qPOW0Hag==
X-Gm-Gg: AYBFou1P4FPSTMnrVqi6CNLDoQhsjAdNVF7ekHNO5XqIy6VX1mFYc2i/9t/Zbq7R3xJ
 5oNwubDTCIHFvX3nKWjP8/vrUbUPvlFp8IvJBJWlBL4g8CJZrc5mePVgJJTJxhy4sS31GSWG0ev
 WZ3APQwRMeAjo95yyrqLOiysttlzWisEukAlShx+3KI7cT4yfy/6r11U8Ik7UzIPbt3japu8paM
 8C9qLcUSvVRtzcyP4/1aDRdgMNU/K6R3vVIntyeyyr8S5Bj6R8X+jen384ZbVOOhCf614J74G2B
 HKubieEWDOPA4BC+m3gZEASMu0D650XvafSdZ0gYD/x8xzgsCG2Af7d5igrhEiAWNj2iSFPFkvp
 noN1NZx4tNzBrlM8b83cuVuMeHGnU
X-Received: by 2002:a81:8a06:0:b0:866:7724:3bcd with SMTP id
 00721157ae682-86677244407mr47618307b3.16.1788276508474; Tue, 01 Sep 2026
 08:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-11-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:28:16 +0100
X-Gm-Features: AcwNN1UEijV3u2vwuPn9QJOEPmesDhDxIlcb0F-5KajZ3mCR4IXC3hbHoeP00Rs
Message-ID: <CAFEAcA-MVRya=Y8i+rURHqizQzJLh=Gp5tQxHSK_VNBUQCAzdg@mail.gmail.com>
Subject: Re: [RFC PATCH 10/18] accel/tcg: Replace size with first/last in
 probe_access_internal
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, 15 Aug 2026 at 21:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Propagate the API change down one step further within cputlb.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 37 ++++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index c2ea31a397..b8c23b2948 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1358,8 +1358,8 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
>      }
>  }
>
> -static int probe_access_internal(CPUState *cpu, vaddr addr,
> -                                 int fault_size, MMUAccessType access_type,
> +static int probe_access_internal(CPUState *cpu, vaddr addr, vaddr first,
> +                                 vaddr last, MMUAccessType access_type,
>                                   int mmu_idx, bool nonfault,
>                                   void **phost, CPUTLBEntryFull **pfull,
>                                   uintptr_t retaddr, bool check_mem_cbs)
> @@ -1375,7 +1375,7 @@ static int probe_access_internal(CPUState *cpu, vaddr addr,
>      if (!tlb_hit_page(tlb_addr, page_addr)) {
>          if (!victim_tlb_hit(cpu, mmu_idx, index, access_type, page_addr)) {
>              if (!tlb_fill_align(cpu, addr, access_type, mmu_idx,
> -                                0, fault_size, nonfault, retaddr)) {
> +                                0, last - addr + 1, nonfault, retaddr)) {
>                  /* Non-faulting page table read failed.  */
>                  *phost = NULL;
>                  *pfull = NULL;
> @@ -1423,7 +1423,7 @@ int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
>      assert(addr <= last);
>      assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
>
> -    flags = probe_access_internal(env_cpu(env), addr, last - addr + 1,
> +    flags = probe_access_internal(env_cpu(env), addr, first, last,
>                                    access_type, mmu_idx, nonfault,
>                                    phost, pfull, retaddr, true);
>
> @@ -1440,6 +1440,7 @@ int probe_access_full_mmu(CPUArchState *env, vaddr addr, int size,
>                            MMUAccessType access_type, int mmu_idx,
>                            void **phost, CPUTLBEntryFull **pfull)
>  {
> +    vaddr last = size ? addr + size - 1 : addr;

This can never overflow for the convenient reason that all four callers to
probe_access_full_mmu() pass a size of zero :-)

Do we update probe_access_full_mmu() to the first/last convention later
in this series ? I couldn't see anywhere we do that, but maybe I missed it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

