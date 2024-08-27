Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53B6C52D6F
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 03:58:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sinLm-0005c8-JG; Mon, 26 Aug 2024 23:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sinLj-0005V9-Uu
 for qemu-riscv@nongnu.org; Mon, 26 Aug 2024 23:58:31 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sinLi-0005Tv-Ey
 for qemu-riscv@nongnu.org; Mon, 26 Aug 2024 23:58:31 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5d5c7f24372so3963601eaf.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Aug 2024 20:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724731109; x=1725335909; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CCe5eZH+NKORsMo71xV9TPirYrLWMjvgWdaTAlepePA=;
 b=IETVbHjQjCmfaiUMoSTTEGOKOfHClVUFkzz5eRQ7LTK8VmPzHEwd8D1xadFdCGKGNe
 WMxX6EH8/AnuTFpQ6lqYtx5Pz+31lt+HCTC/oKf9OTSYm0aAUdz0OPCrCF09PO8LE2PU
 7mv7alDyzl0NOLRPijpS8siFOamOWjSDvxAAGga4o42H1o15GRrn4vHtbo36PtSDznz6
 DeLrr4POe42k/JSBOmmo6KiRKdLCPjyr49feo11YMeqhFlLm5vMaWeFBUj3Nif4KZ0wB
 YyyjsuRzk8E1A1efJH61Aiz9yBmqxVobEk0rLFED6pXeS9lXKLKor04SV9yf6vxY6CdI
 wdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724731109; x=1725335909;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CCe5eZH+NKORsMo71xV9TPirYrLWMjvgWdaTAlepePA=;
 b=iwMAkLQQtrQQMSqyq4EvpkOh6Wa3Rru/P1kCxnwRYnRBkbZJtYcvnBPmN6APeKUf14
 d0IZc2RYz6Eg56s3skp0PczUHNluu5viNl/cSQ8jtqglS9kT0b9vM6LTzCdO/Jd+E8dX
 r7IV8RXUjg954hwxwEyUTz0Sa04kTu2n52AY2XDViiAz+hWnufv2WouBPWQuPCp5rLY0
 7czUyP+1DZgMGs0mIqW1/iXNYiPe/T+ib90ApCcEO8yUBzg8TSvpg4bWCNFtFwr7NR5x
 48Pt5h2Yw5WjXE+AxvgWPds5TYdGx7uB8TIsn1TH4u9lrdT5+fWYsA0rS3wHkLglBo0e
 elqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOfAwGnMC997D+zVsELKcYzwOGw7RRRzO0j2v+5yaUysknJ22XNJ7sU0BATnojepwG1q25ZxDctPf0@nongnu.org
X-Gm-Message-State: AOJu0YwWif6lzFqQWUiTtW3zk4a9MroTcFSnKZGFX+KzBgLhsuyzRKQA
 pf/o6Rjx6XEfAe94JjpnizVTI5qrh5uG2nzs+3u7TkXs+Z8heQfaeIS/A9PDFs8=
X-Google-Smtp-Source: AGHT+IF4czzlgMJJI47soeFIUKhiye2JG8VhHryaeV2X8fB7QiHdE8TQsx6DJkEhWnDLY26XssSgTA==
X-Received: by 2002:a05:6358:393:b0:1b5:ec65:7fee with SMTP id
 e5c5f4694b2df-1b5ec6587c9mr191657055d.16.1724731108727; 
 Mon, 26 Aug 2024 20:58:28 -0700 (PDT)
Received: from ?IPV6:2001:8004:5110:2082:f68a:6871:1edc:69fe?
 ([2001:8004:5110:2082:f68a:6871:1edc:69fe])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9acabbfesm7220763a12.33.2024.08.26.20.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 20:58:28 -0700 (PDT)
Message-ID: <db8fa0c7-5c8b-45ca-a0e2-e660ffe7cd42@linaro.org>
Date: Tue, 27 Aug 2024 13:58:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/17] target/riscv: save and restore elp state on priv
 transitions
To: Alistair Francis <alistair23@gmail.com>
Cc: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240826152949.294506-1-debug@rivosinc.com>
 <20240826152949.294506-4-debug@rivosinc.com>
 <da021104-6836-4e5b-a8a4-991f975c553c@linaro.org>
 <Zs0jURx7jbgd64jV@debug.ba.rivosinc.com>
 <056740af-1b61-426a-940d-3ca118ebd081@linaro.org>
 <CAKmqyKOni_x8bw_3TfdV=xGg0MX-NPnPgo84dsKojdRqO_j36g@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAKmqyKOni_x8bw_3TfdV=xGg0MX-NPnPgo84dsKojdRqO_j36g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/27/24 13:53, Alistair Francis wrote:
> Exposing the *envcfg CSRs to userspace seems tricky as everything is
> currently built with the S/M CSRs removed from user builds.

It is as simple as moving them out of ifdefs, then initializing them as needed in reset 
for CONFIG_USER_ONLY.  That's what we do for Arm.


r~

