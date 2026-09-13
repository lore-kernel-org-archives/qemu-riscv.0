Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87E6C88E56
	for <qemu-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 02:45:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x5aAx-0001pO-42; Sat, 12 Sep 2026 22:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aAu-0001dR-GZ
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 22:42:36 -0400
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aAr-0001rQ-2E
 for qemu-riscv@nongnu.org; Sat, 12 Sep 2026 22:42:36 -0400
Received: by mail-pj2-x10.google.com with SMTP id
 d9443c01a7336-2d747ee1f9bso11069445ad.3
 for <qemu-riscv@nongnu.org>; Sat, 12 Sep 2026 19:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789267351; x=1789872151; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=yj8SiO0dYeas5u3bsy4kIe6iZb51M2JYTIFBms44mis=;
 b=jVr5HtVGBguf+cYi42lajpgT/9kINdbHEvx79cPfqtgvulj7XBS2DYfvwzdyBaB7Mc
 oImwAOSptXB/oibbdxeSaV4Lq723kj+yvUA1ul2yLYtSRv9NgFryttZtOXKkNwDT5vQ8
 61QPbTJVpwgsHynWFhHsy7+3EwQovBq3i90dlMOuLSEpbUVR0nnRlU6iNCPbWGKECM9h
 Aci46roaMI3NJ1NjqTdqf3XLipMtEH/BY8OXRJ4uEYQdbjZ4onPQ6vjKp+RQQljAQxVz
 Oq7eTNfmQYl8FiwjswGxIDgHxWIVzScgdnDwejEu4TsdMqUGV1osOPxMf3fuKOR/NoLi
 0oeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789267351; x=1789872151;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yj8SiO0dYeas5u3bsy4kIe6iZb51M2JYTIFBms44mis=;
 b=ZX/vBM9FfU3YiKoPgE/lFdn49zd3iQF7yNMcpvh6a3G6WI+X3Y1WUQ2uFCIHHsFmRJ
 Wc/g4GLn8XA9UL1LILShuvfcvl8gyl73EMftj1LqadBxW0Sz9+eHsa+cmYNhHQxHrA1B
 jqodv1EqGygH/tR3C6ieGEFeHERtpH9a4t4r5bu3MftM4VDiekkOqMp+d4bFefBFwGLh
 tvIah774bCLbysk4cAmArQgZfuA0eH3L/26gZsGU1P+QTEkK91FEmjZXkcSmVs4JbCvb
 NL7EPRlJKq/Ei0Xkyv4p+u5Zotptor1QNsN4ibcCmWLaFrVnOo6+KRdnQZf3Px3bf808
 sTgg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzXZxZbiG4b+s0bFotbiQYX5nj4Qqavh5k0vJz/s/Sv0iwRVj9PVUS1vadEvuglNCCJU+x+YW1OLLMC@nongnu.org
X-Gm-Message-State: AFuF++m7JGhVHFsZZI/wzYDJk0HxYjafbbU/n8keVlVOCKbu2y99zp8j
 VaYeHjxIFX6GONor5N3EVhIjZHQrrRATipiHRD1b6dfH8doIoc6zN3Dca5sLAkiX1jA=
X-Gm-Gg: AYBFou2NWeFO955rxPp1/dY9zWTgReeW+DrmLqF6gVXbHgm+4UFwgt0jTUrC6Ia/zqD
 py6spMilorIh9Bpn8zopbKYn2J6EMWmz/rKn5C1e2rJO9++HvBdaXSwGpGrtrGmGTEjiCNpdLRl
 1FhkFkkhv1ar+NnbALZ7PbLrr/GWg8E8hKpN9hDeoN3Dm3BhRW2c20EnwU9C7zzCG69yik4DLRl
 UlCEBgLBuRqBDGIcJDh+Zbs39zmls7mUsn2tolc04S/nsXEYaStcp2agiPrxv+9SipK5i0+HRtU
 37dt1gpY6B36h74KxfpgqxwikIE9DXnaviN5zmPkz2oOT3LYT0CJXg6phSQVHiaaEv6McD8YO5Z
 DgFcS0gf450kbgENIwkKIn3xNBEXjGBmSuV0zkJiisTttgCu/9rFCWOzjAPn+q3ABABMphmL6qF
 f3eSEV/eIsZGPDJgtgjo19y5qCzwnoRxWkISVaSa50pxEvo1KyZ58EVvQPpoH2XuZh/z30ovUxN
 7XTiOTKhMnK1bmVj8gEw3YKQF9OzLjjQJwYUG1vlHKLm9dLa55Aj+wpKwK0Z0BcAScXRA2g
X-Received: by 2002:a17:90b:2547:b0:398:9be8:ea64 with SMTP id
 98e67ed59e1d1-39d9c225ceemr20661294a91.17.1789267351365; 
 Sat, 12 Sep 2026 19:42:31 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365ba71cesm16679059c88.13.2026.09.12.19.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 19:42:30 -0700 (PDT)
Message-ID: <b6680d48-d6ff-4b3b-b19c-29989b8f9ef9@linaro.org>
Date: Sat, 12 Sep 2026 16:42:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] target/arm: Call arm*_cpu_do_interrupt directly
 instead of via TCGCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-2-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-2-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x10.google.com
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> The TCGCPUOps.do_interrupt handler is a target-specific
> callback installed for use by target-agnostic TCG core methods.
> Target-specific code should not dispatch through this indirection;
> call the ARM implementation directly instead.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/arm/cpu-irq.c     | 2 +-
>   target/arm/tcg/cpu-v7m.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

