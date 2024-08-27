Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA44C52D6F
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 04:29:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sinpb-0005FG-FJ; Tue, 27 Aug 2024 00:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sinpa-0005EU-FI
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 00:29:22 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sinpY-0000ko-RL
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2024 00:29:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-202146e93f6so51163145ad.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Aug 2024 21:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724732959; x=1725337759; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EdzeHx07n6SnQJINJeTOXUBRenILNVfPrSq35tVcFiE=;
 b=KPsHGD29nA1hEkVjm1fq2Fq+dBgcdUPDWYpDf4dTtqj5JKAfTwg+2PI/eJv5DARiFA
 6+yAANp/XRFYuOjH7GKuNbr5frUrWD4ZQHm0AlbwGIR/Q+4NEBheJRQxbmuwf0cXL82x
 WhW8n/pWreQHYV8+lbaWtvWyOF6JtbhgxV1TtiIfC6GpsEAHHlS9AxXed7mjzpEFo/8M
 dzNvXGwhgx3uMZ/XivRkQ2+N+WgQSPsV0And2dLGokhwK5x5pQgl/ed2vWkqP0mkKMVN
 F9CFukIqzvoUsq8CoD2dT3uJnRznvfdQU6hoIU323s5u1C5kvUylpFQhmkEEQ02zmKti
 i42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724732959; x=1725337759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EdzeHx07n6SnQJINJeTOXUBRenILNVfPrSq35tVcFiE=;
 b=h0ptimRNrCqP9H7oNhtXhWdLw1GypecN/gK+e/luiHCbPefrBOfXDYl3DbuugAbXv+
 s2PDjWk6hzbcxh3f7nAE7mB6NCGZZPcGAs/NJ+ivOlI7nb59ySnVV5Gk+TldnCG7JCoZ
 cjBbRgmZArP25+wrLPOEOSS3pP9lbj2+iQFNOuGfOsBMCQZ6aTBToNuDlJuannERC3Rw
 dGZzoUaay5fK+jiyN26uBD0uIdCROEuoAmufjv9yw1O5PEeJhxuGlJcdfKExRtdW0Jpi
 urEYFiOWfITpXjHRJduFRMYIGXnd/tuIOXlcxpq50FF3gnVY65X8k3cB5GLs8XEH7yqB
 czgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyCo3t6UZq6DXZCo/uxKpjFgMSor0qMZK3qJCgVtHRNMwIgIevppo7VuHNoW/6MagL369uSQHJzymE@nongnu.org
X-Gm-Message-State: AOJu0YxDqRRBvzaROk7ZWIpgx3eJJ44cmpp5OCSuvj8/uGRKJlBA5NvD
 Fuq86cO/rk66f+MzONQGM7kL3Qs6rLoNcAF+G0kiq4xwPyJiuQT1mHH5E5rllBM=
X-Google-Smtp-Source: AGHT+IGUoJ1uFHqVbKvI25Lq+3/hSf21GuU8u3JUFgI3MjDyY5TkV+mt8QgyR58YZ7xvX7mDTurOjA==
X-Received: by 2002:a17:902:c94b:b0:202:708:3443 with SMTP id
 d9443c01a7336-2039e49d24cmr132243915ad.27.1724732959054; 
 Mon, 26 Aug 2024 21:29:19 -0700 (PDT)
Received: from ?IPV6:2001:8004:5110:2082:f68a:6871:1edc:69fe?
 ([2001:8004:5110:2082:f68a:6871:1edc:69fe])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203855dd985sm75366245ad.164.2024.08.26.21.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 21:29:18 -0700 (PDT)
Message-ID: <20467a9c-e12d-4d36-9439-4ae27045077e@linaro.org>
Date: Tue, 27 Aug 2024 14:29:10 +1000
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
 <db8fa0c7-5c8b-45ca-a0e2-e660ffe7cd42@linaro.org>
 <CAKmqyKNN28WeR=UsPjnhFZi+W9imeE6v3tHsX5bj_OwdP7XyiA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAKmqyKNN28WeR=UsPjnhFZi+W9imeE6v3tHsX5bj_OwdP7XyiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 8/27/24 14:03, Alistair Francis wrote:
> On Tue, Aug 27, 2024 at 1:58 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/27/24 13:53, Alistair Francis wrote:
>>> Exposing the *envcfg CSRs to userspace seems tricky as everything is
>>> currently built with the S/M CSRs removed from user builds.
>>
>> It is as simple as moving them out of ifdefs, then initializing them as needed in reset
>> for CONFIG_USER_ONLY.  That's what we do for Arm.
> 
> Is that really better though?
> 
> Then we have these CSRs that are included in the build, so people can
> write code that checks the CSRs, but they are never actually changed.
> 
> I guess it simplified the CONFIG_USER_ONLY checks, which is handy and
> your original point. But it seems like it is clunky that we have these
> CSRs that are kind of fake

They're not fake.  They're a reflection of how the system-mode kernel configures the 
system-mode user environment.

The u[bf]cfien variables introduced in this patch set are an indication of this.  Within 
this patch set they're always false.  But the intent is to implement the (proposed) prctl 
syscalls that will set them to true (on hold waiting for kernel abi to land upstream, but 
were present in an earlier patch set revision.)

The correct implementation of those syscalls, in my opinion, is to set the corresponding 
[ms]envcfg bits.  Just as linux-user/aarch64/target_prctl.h does for SVE et al.


r~

