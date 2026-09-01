Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1045C61DD3
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 15:22:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1QJI-00065L-IL; Tue, 01 Sep 2026 11:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QJI-00064i-3W
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:22:04 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QJF-0008OT-9R
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:22:03 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-864cd11a932so14250387b3.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 08:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276120; cv=none;
 d=google.com; s=arc-20260327;
 b=RvZoYdkLi/QPKgILnJim2gCKXKCs26DHrZ+Jb2HRSTMvR8rpKrA0zoxofVNIi7M/Mf
 oxQ1P8qKVYUsDQAY5XKB35mLFlAVPEg4cpFGtlzDsgumXg/t46poLBRhi3Y+ISjOl5Si
 MJNxct7Ypblcm1Fx5wrA1udWrw6nfVo76I6j3UCUOVw9Ri4tM9ksdlbsj9r6x11iBnhu
 oRqKtKczWqHvouTt7HZWEdHYZYpl9xj65QFDmtDcrsdq5p6+OJs5cItLk1XPJQD+VX42
 drQbF/YqEeUyRcgbSaUwK3TPzPEsXIS+5t0KFM/a0gIXhJeQ3o2zumkQz5BySNZBz4+S
 em+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NPTGdcFSJhaCrmSR24FP951+qs5BMX8kS9irH5bhNYk=;
 fh=ZvyyVrPeRTCvemQqNBEpFvWri1Yy3gOi+cHZ+nvrluU=;
 b=mY6c2mqRdqhey2vDn9yTREH790ATo5UKvGKhSpxa3Kdn/wih7D4IM7DDNESEhY8VlV
 abqchFvP2rDo39aUew1PncDIF3ubpQjGyewgJ6xxpSUegSpJZqaK/qv62Rftk9+DKztj
 6ySo4llMWGsFEoVaS08PgKug7d6sKWpWKnv1UR+Iy0XiPyOC8LB/jIPVNvxuhEI7ykcB
 sJ1fYrcBbTX7em0v5knSMhZK+lRXKW6Z4q4EIBX4deGrupJpdle9Doinqdcc01//gj/F
 QS2oesT+xT3PI9iVHihPBerdA6wTVJMovC1eX6Snckvvtk8ZtDNGXOSp6B8QPwHFFXYK
 /4yQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788276120; x=1788880920; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NPTGdcFSJhaCrmSR24FP951+qs5BMX8kS9irH5bhNYk=;
 b=Ps8BY5rrKskk+lDsgG5t3S3QF4C2RDVx7HCwGLy00Q1cdxulAD/UjQvFkM6UcfS1TK
 4PX7psLWtr1D3VnZvFrtEK5wDUHnf5G4U6aKTavE85IvqV+OrLEO/rGE7wv7ngVZh+lD
 LkWsEeJmpUF1edcy2KZwMR13c8Vv2zmgyekt9KnP9w4Jo/AQLu7UE4Z5UQMXDh/UpPS/
 csrn18K8WUWk3zRmgL4FLuL+8IDQteGhtYCEPse6tf6unKXiBoR7adjIm9nGM0Zg0xJN
 IHGZ6LDMkHPyk2uhdXzBBWCnzeU3l3xXzZRtsjYf7OSJ1+DPlEQlTXk5ocs94MybT+ZS
 pgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788276120; x=1788880920;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NPTGdcFSJhaCrmSR24FP951+qs5BMX8kS9irH5bhNYk=;
 b=eAqMmlMvNxNGoKAkqU0VczfmWEybj5OwimF0RAc56RCAOsfAyvDh72YUnpfFTW1jwQ
 2HSTtSI1yybb1AcljrFhb8MZhurqgU5yRzX/cHLfR01/Rf8CIwsWIM3EXTAw9RnFD/eH
 Gm2Uq4rOc4xAR5rYY6aYQc0F0IiSuUIV0TXurul78cYiQt/IT7m1TbAP7r7PdRxjq2pq
 BHtg+VaTUsz2lqWVP/zMcl92YFqV8WmGs9KRvJcqbzd9yjrr1m7huUqWy+URrQ75a7Sj
 nvVQC356KYLhxT/Bu/lORo4ZbW6Q5gycbUvhLWKI87ViwPTKXREB84utbasR/Fj/vuLh
 WtkA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwpAkQDDQgnYu/PCZSsrfQfwvEiYH6ngI+yEXvEw5BZD2vzyP6/dJMbQfOyhPm0meW4Gnxehz9T+xJY@nongnu.org
X-Gm-Message-State: AFuF++lzTAz4XLfoI6O7cLlDnHW15zRt11/o15ypkt2u7TV0wRYEPXd5
 o12++p71TDLDYMercYXG3hOYdIRDsA9W3fA2R69YKclbA7ArNT7uQM9EmRkMzLvuR0N7Xu65xWr
 K1vt8a0CMpEfyDOxiagKaLh7JukpPOhxoPhnTYxpNFA==
X-Gm-Gg: AYBFou0GLMMX4IJ7LZOarrGzDPHHshk/VMuNOlEyHk4B1qiqIJukpXAR080kGuj+5BB
 F4UousAbJNvJ7vaEdORERh7jzLfFxyJNMCqzXqHPPoRVMMFzFG8qscgRdOkrAl3IQIfFqP3Ymxq
 SwVe/A1O5FidOChugoxs/uOjyYcSsLU7OcgvNHDkKobjpihTNsyPro6XHolOP2mW0MdHhcZBVLY
 gbAUeAp2D+nOdSD9lzn4Omi0iQtd5wLTPumZsSbNQrJc2ain8Rw40uESbg1wEFreEAkQ90sTErv
 wkPNmsBx8Dr6Gcioae++vxTrinachJyO5EuOujuFyY9FLjMkexdwqryqwd5HVcCoOgBgqB8flMx
 pmtYLIfQjdVAenLvBnWBRf+mBSoKyFBu/qT/G+4s=
X-Received: by 2002:a05:690c:a7dc:b0:80e:dc2:873b with SMTP id
 00721157ae682-8694d0f26c1mr25481777b3.16.1788276119819; Tue, 01 Sep 2026
 08:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-9-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:21:47 +0100
X-Gm-Features: AcwNN1XgVCv_F9f-hV547-VZRoptUeYrotU46yMTkTDPrOiyTTR_lcVQRovmu5g
Message-ID: <CAFEAcA_S-bbWV6aSJp+LaQVPD3c1v4mrHoM-ZWs-meY=M8nFXw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/18] accel/tcg: Replace size with first/last in
 probe_access_flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/accel/tcg/probe.h        | 24 +++++++++++++++++-------
>  accel/tcg/cputlb.c               | 15 ++++++++-------
>  accel/tcg/user-exec.c            |  7 +++++--
>  semihosting/uaccess.c            | 10 ++++------
>  target/arm/tcg/sve_helper.c      |  5 ++++-
>  target/riscv/tcg/op_helper.c     |  4 ++--
>  target/riscv/tcg/vector_helper.c | 21 ++++++++++++---------
>  target/s390x/tcg/mem_helper.c    |  4 ++--
>  8 files changed, 54 insertions(+), 36 deletions(-)
>
> diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
> index e3068a79de..06faf1269d 100644
> --- a/include/accel/tcg/probe.h
> +++ b/include/accel/tcg/probe.h
> @@ -49,23 +49,33 @@ static inline void *probe_read(CPUArchState *env, vaddr addr, int size,
>  /**
>   * probe_access_flags:
>   * @env: CPUArchState
> - * @addr: guest virtual address to look up
> - * @size: size of the access
> + * @addr: virtual address
> + * @first: beginning of virtual address range
> + * @last: end of virtual address range
>   * @access_type: read, write or execute permission
>   * @mmu_idx: MMU index to use for lookup
>   * @nonfault: suppress the fault
>   * @phost: return value for host address
>   * @retaddr: return address for unwinding
>   *
> - * Similar to probe_access, loosely returning the TLB_FLAGS_MASK for
> - * the page, and storing the host address for RAM in @phost.
> + * Probe an access for [@first, @last], where @addr is somewhere
> + * in that range.  Normally @addr == @first, but some targets have
> + * accesses which are forcibly aligned after an initial fault for an
> + * inaccessible page (e.g. Arm DC_ZVA, where [@first, @last] will be
> + * the bounds of the cacheline containing @addr).
> + *
> + * If the access does not satisfy @access_type:
> + *   - if @nonfault is false, raise an exception at @addr
> + *   - otherwise return TLB_INVALID_MASK.
> + *
> + * Otherwise, return the TLB_FLAGS_MASK for the page, and set @phost:
> + *   - host address for @addr, if direct host accesses are allowed,
> + *   - otherwise NULL.
>   *
> - * If @nonfault is set, do not raise an exception but return TLB_INVALID_MASK.
>   * Do not handle watchpoints, but include TLB_WATCHPOINT in the returned flags.
>   * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
> - * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
>   */

We should mention in here somewhere that it's a bug in the caller if
first/last aren't on the same page (and we assert that).

> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index b7b3805a6d..87f2196bc7 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c

I don't understand the code in these riscv vector functions well
enough to have been able to check whether we have "calculation of
'last' might wrap around to 0" issues here. The other changes
in this patch look OK on that front.

-- PMM

