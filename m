Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C6BC02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 17:19:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbNKe-0007Xs-Jo; Fri, 24 Jan 2025 12:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNKe-0007XU-2S
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:19:00 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNKb-00077r-KQ
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 12:18:59 -0500
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-7b6f0afda3fso166958985a.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 09:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737739136; x=1738343936; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4twTcQVLQKgIEzuoRlWRF9LAXLNCoBjPsZMisdjD7LQ=;
 b=i+Y00KXEhiJv3ENhp+F1GxbZv3Cq+28YtDi4Cl3FsVK5RILIS1EqJE9wfP6cySWMte
 oVdNr5uWHGGMVxxbZmKHI8w6umsX06kYuxuj2iS0kacgwSQ0jw5UWU875RApFAuq6983
 IUA8oDYBuSgHGIWc0iweupOSudhHKjBvyGjFQjlBSPUUebFpu+6UjFJkgJpKPT11Dmd9
 zo7lTCMciGMbij38K00PRAWdh/8AnD1aKfwCBtYMKlm/b62EOIwNSFnSEfkVmGXLzAiI
 Z73cPNmlgSASSgx1RQWASO4kkf1Rqv5xsMoKhuesgLq6GAjQQJfdHEBwb0/LhhDkJF54
 La0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737739136; x=1738343936;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4twTcQVLQKgIEzuoRlWRF9LAXLNCoBjPsZMisdjD7LQ=;
 b=PAMokEKMYcstl8Z55POd82cd7SfDMq6ObuxMLh1EI9xTBvH1FxL3RIhpl4Gcei+08C
 eKaTq06pk8qIY26sLHKf/RLpS4g+mmPBHAExeHmRCU1CW60TmgS9NVcfXP2kZZrawbJ+
 2Fzq6g9XdsPVbe1/LK2YyU7wFufaKrWqAT+wM7B508p59o3761y9xXdfg6kodlHoPqKa
 yDj3ACnyUrzIDscwFACeP1TBCVI+Rp8iqrn2rEmkNwe46wcqtlvnOblKERzKLjHhJ0jt
 Lx/oBJhsPBepVug6hfs6V4K0WbxUIDjphozNEd+a0xoHev+AVnjZTgG1wdoJj20oOjQk
 pigg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBRePa+p6WggRTpEviViOZvL1CTu5qgE9lCYte+SNrGnibmXwrIaiUcxrtCijO1NUgjQ3AXn2jhLBp@nongnu.org
X-Gm-Message-State: AOJu0Yx5hDDmNNIrHyQkNMook+ius9JPzLXTSoHZwHHIAa7AX7ob0HD1
 eQxfgW/mUPd5wDX5e+LTB62Hi6yU+S1xsVwokEXjVrNR/5Ne4tIqHi8pb7BGRT0=
X-Gm-Gg: ASbGncsm7be4/63AYt9Zgt8jVRO5aHhxYnIq/lP0NQLNlOKzpvJ+gSrPQJSxD0n1+j3
 es8tBmAq07DAMJLdj59R36RYoccOmvIsTeNP3UhT6FG1w8kYPUywh3KMUdVZBazIp0u9PeJ8lVJ
 1IVBpnTmFEX0b/J1P7DlvbbrsQdXeDTk5aPLV7AUShwTeIgBge5hkD8Gug1To++nty9PnGhKeX9
 7NW+63s78OaEUG8jyfuKe4BOG552qJtZlwgb2IgSJiePCteNVwKOEsyFS4rvl38zinEAOEpe9EO
 1la+q/5Xb2cOgrwlew7wVitQHrkGteEf2oGRRYuddvGKNFmaV35J+RmRZvhjTTJgbw==
X-Google-Smtp-Source: AGHT+IF7tptKJBQqZN+j8Cwu2VbTl7sjQA8imXl9CWIFDp+aw9+vkQKjGfibAHND7i1Poa1Y/og2LA==
X-Received: by 2002:a05:620a:402:b0:7be:82fc:6871 with SMTP id
 af79cd13be357-7be82fc6cc0mr2199049285a.18.1737739136568; 
 Fri, 24 Jan 2025 09:18:56 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e668c921dsm12102881cf.47.2025.01.24.09.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:18:56 -0800 (PST)
Message-ID: <58add097-ae4d-4d18-ac8a-776b6ffc5fb7@linaro.org>
Date: Fri, 24 Jan 2025 09:18:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/28] target/s390x: Restrict I/O handler installers to
 system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-23-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-23-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/s390x-internal.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

