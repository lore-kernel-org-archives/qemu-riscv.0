Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DA4C624D3
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 14:43:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1Phf-0004rL-K2; Tue, 01 Sep 2026 10:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Phc-0004qf-GM
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 10:43:10 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Pha-0006Q9-2z
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 10:43:08 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8565d77c277so48082407b3.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 07:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273785; cv=none;
 d=google.com; s=arc-20260327;
 b=Ad6BP5uKtgVMPeU+o+UTEuZOXsDtbvYShFk/8ZY5pa1etUwgSyQx780UmFnpTK56eY
 h2YMFcQorb25kPNjCK4raHmFRcTUJuPz3BHrLtJZLcm3M9uDI1xH9UD8QeIVcB5HXgwn
 O5Ez8+AuThUek0UEynNKYbPq32T8ZIhlyaUjPkBCU7+LAhljSI/3h/1uqCb0xGFM5dQj
 28LH8CxRpuaKtcNJKfHNuXdQhIno5i2PytgPZjrNEukmYrexwc7l56ltR21wT9swW1bO
 27HRcuBe0FeLVnDI//10RcVrWRLP3kpeKH0xMv8CkcbdyQFHAfQk7ZLZ8gP/HUEL1rAR
 wH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QO2CmtSZJqRqK5aZrDGJlW/UwjtyZh866PfxdVIqIuQ=;
 fh=cTg2Goa0BU+dPqdFccqe0LXfMut3464bKSnXFV0XZYg=;
 b=pdtjdsiMJuxR4YXYoraw0gQymf3oYoPKF1DeaW4olOyeJDjIkL49DqbyfcpsmA8Mlg
 Rqum4QSIPx89f48fIA3V7ShcAt+6ESDg3LP2KhciNujxc5S5K+IezG2dSQtAgbA2diMN
 HcvjJWeenUmlAJosOP4e/AUcLeP2qHb6Bj9rxeQVpohZ/QD3mCULY8ApUe+ANyqyzL3K
 BAi06Nj0Az2q27DyUHu9huDNxOlQOghYtD6kKm68C3s2Af++SBEh0gL0u2UL1B8H44of
 3GT7ovhy+xAfAh6T+XdKqF5vaOpvT4aq+0dux2nNojF9PKRjTEBzN+Pid7BTlzheKdBl
 PgGQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788273785; x=1788878585; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=QO2CmtSZJqRqK5aZrDGJlW/UwjtyZh866PfxdVIqIuQ=;
 b=n+Ug/O7lwgrHlsXUQxlecYW++tZHXYAFQqHNro7QxL4MDdMZBXW+cwtNnMgPrLYCer
 2MCDi3Q7zaMLSWpHh5oTrCxadlpDBIay5M+8evF8utSoT3uXOuw96LqMtsAab2K1sxkb
 hHCxhNG4EuMXMIehvxkA6wqqQT7msoQk3NCqEjvW5oyTmCEzBxD08lg/DnMZBCidhrgg
 LNOaE29JdbJNBh0vVzd62tXjQbgvRAJNcV9jq5S8CXUynT8vihQUjCtOG6kmfpHC/lYP
 WGZMrJXg7tQzSauUWmV0aoWleUku7sQJt+gS7z+baXruT0Vn18cBivyThCoCoLYJ+0si
 EHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788273785; x=1788878585;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=QO2CmtSZJqRqK5aZrDGJlW/UwjtyZh866PfxdVIqIuQ=;
 b=XuDPDpkjsJ5KH6eitzk5pe+o93DYYodLb/6W9fZFlG3oZqOkyDMwb169QITJ1qGPPI
 ep0BN/PZWqB9p6BUnM5ceZnOlgOFJ0/xrG9i3U7cMbJq00rolnT3y49i53bMCexLIgLu
 2iaz8alDOAJIvRFQbDXYNlL8SDrldFke7Qn3Gcfebo5irDJMn/f34AixGCDOZBPvUQmG
 g2smVrG1JQhEbUR/rsU8o0Kmy4wETpCJJl+kRzj4wO1V32ZUtWd0xIBWlXplKZ5qXabL
 oJLIcMCYdG+QIdsTdcYoUZtLSbdts0LIm2DY0R/b2vJEK/N/2BYn56VNAEn+SRtFP5dp
 wPrA==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1tO0dBzAORXX63RJstAV08kgL8zkqvpyAqPWfZ9swZHciga8+EctIONuk1vvbSqRfCPvYvPwqSfnH@nongnu.org
X-Gm-Message-State: AFuF++mJR+GW9aGRQBVjbymsBj7NQWYoG+SVhjc9TN7LqHAFwpUw13pi
 xbXqJJBsoc59ivxzVODx9CNGJA9s2271+yqwIABjbLAX/IkFbx5qasNIbqglzchnfhSJHX7BgCL
 8rImhn91vBZS+pSHXk1PuJpu3fPsLlsFfm2hITEvZjg==
X-Gm-Gg: AYBFou1pjBQZ5diq3G/wWMt5QvzlcrlJ1q86uNf07heGluPB2LLUlpuUsEuLMX2S1fa
 inUaPNWQ8gQyJ5n1vdGqCnEA4lX4PcCDtfWg4+yYZBK00/IEgP1QdAV2PktHS334Vb2mRO/28RX
 2DYgsN5Fp6Pje0zh+2yFI1a5MZ7OG5Zx8ylemPqSL1fp395JSTOSssBpJaxBVTbv3Pi5dWM4d7N
 lh5zuewB/E/gIR6LjJlIgsDHFaT3rxoaA9kWASF4Kuw3dIyjP3SePdleCfSne8ofAtuJyDLZXvq
 VmTHe49nZWAApWjTCqv9rfyvyJGckn1CGZbyETLbdRSR3/ZLRdXVCdUxG4369/xsUR0wPLpX+aw
 1GJYqFBXD3jtResugldUZgY9MqUWb
X-Received: by 2002:a05:690c:7003:b0:85b:f1ba:b076 with SMTP id
 00721157ae682-85d6a7c5a18mr131247437b3.9.1788273784203; Tue, 01 Sep 2026
 07:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-6-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 15:42:51 +0100
X-Gm-Features: AcwNN1UoQR0KODSwrd0TZhPptNbegPArztbJECkLwRb1SLvhT8Z5ysKRnE0jX3U
Message-ID: <CAFEAcA-+AJwEE4MOw5WgA-RgD=8bkcjcMQc+_9wkGoDUXX8K=g@mail.gmail.com>
Subject: Re: [RFC PATCH 05/18] target/arm: Probe second page earlier in
 allocation_tag_mem_internal
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Sat, 15 Aug 2026 at 21:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translation faults have priority over everything else in
> this function.  We were failing to trap for the second page
> entirely in the user-only case, and when tag access is disabled
> on the first page for the system case.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

