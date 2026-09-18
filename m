Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3321DC982D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 19:16:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x7e3k-0005YE-I9; Fri, 18 Sep 2026 15:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x7e3i-0005Xh-Cy
 for qemu-riscv@nongnu.org; Fri, 18 Sep 2026 15:15:42 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x7e3f-0003yX-TB
 for qemu-riscv@nongnu.org; Fri, 18 Sep 2026 15:15:42 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-396ccd66bb4so1047377a91.1
 for <qemu-riscv@nongnu.org>; Fri, 18 Sep 2026 12:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789758938; x=1790363738; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=d/RY1i/cVRZf0y0jqibpZU8KI3rY0URS4V+/Dy5KJ1o=;
 b=U5xTQkosmJMFGZkxV21Hv5fZiOC37cOTy5V0++W+HEJB6JEe4LcfSymUouAByQ/dNq
 dK6ydCKPFDr47nRzNuRvYJZbqlD7umMhmWkcMrltdHfpIwi0HAN4agKokR/Hj6cxdn/H
 DrcsiD3zQaBvfgUxcBQ1DD92+gCrCz9Z/WQFlwrdUecWvW6tS90SodzcLWLePM/agcyO
 18cb62M6oRdQVvR61PgwGfdteBWsv/k4rDepmgZV4UECxA4wNlJG77pg10g8dazgy9r1
 GcHREYe+hHqfCC59p/pflykkKP8zt4iICBLY48oE2nw9Up+yBXL8Ek941/t7OXSHKHHC
 mtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789758938; x=1790363738;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d/RY1i/cVRZf0y0jqibpZU8KI3rY0URS4V+/Dy5KJ1o=;
 b=ysNVnP2gFvlPN2ZHiBPwQUVvCW2FJitYJp2OlSps6sUR7Ti8P+lhM1BokM1/iat8Zg
 KvNDeoFIJE8OV83yGZAEp48LASlJ7HWC3i+3J/WRHwmnSZawHRZ2Me9xa6Py5joc+q6t
 k4r3fpZDv/mxU6xk5TSlchAeK2yyS3Jhsi/z/Cl1UyZmBhZ0NnDiwSUTuId8NvWsGTLX
 o/mQQRmVnQeSeJyXojj4zg1vMSxmFHqNHiOsl9iGUrZS75JCh//RrIsRkpPKUo0HmD3x
 yggFGobJQPFPyUmHO1STWZQ+CXtrPg2LHYUvb8x5ttzf/rSxZe4AuVKhlWGGwCd+82zg
 /9Gw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFMS02riHRkefbv4FUuOYk9qLEL3dk1dR7Z7E9b3JB+32jKoxX9RZob0eUg83wKybgcDCoeKTc1nIl@nongnu.org
X-Gm-Message-State: AFuF++l5iHkFpjXppKt/4y8Oihy57U47P5k2prMetNEfwekTqfQ4x/MQ
 jxy8G5w25J51knQdVzETQFR6TligCoZ5Oz/ksUox/jtBRHElsfkAyNNvM3uGxpALjrQ=
X-Gm-Gg: AYBFou1BADxehGDqn4flhP/5banSqMef1UAmxzeBUPFSQlVVvxF7KCM3eGWsAwqqhyL
 AIkWpwGoC49DC3L4Nd23WHSePO3i6JvDuOBOZmatiDs+lNpcQtSghsI5Z9Oll5ZMMq75QH08Tlz
 aJz2JE8MgbjHZIJdYUq4ssEepvkAYMqDJTzBhnIFbnJsB9oZBKSyXC0ty31t7tgFJvIf3lqnXA6
 lJPovFRaosMU8Q9e9fcaHG2RiutlgTku2RcUgEGrFtiDFMs02rNsz0ZQ6VdvzWHM+bWWwHi0Vxh
 8N4Oa/n9S6KAyoYBjYspg9aGNa+zy6KezroTGIEj+xkGuJn8VrdxBEVHITDYGIpoQ8ltiAmr3qw
 Y5rsF8d8S5cVwMBxWEuWgA6UcrqIZMb2w1vt/w9vWyVA97YCRt313hpucGCBKWu4/7lumiIFgMn
 ik6CCSTKdyIfylAYB666oQhC8bc71gsootrymfyCOOSXyDPJh8nKPa+Jw9itQfjXRS8YeZlXMyI
 iEmQejNPu1obSnwamUiAO8ocYVxuB2LmAopkp40nnUk6S/PVggIptTqNaV8vQ==
X-Received: by 2002:a17:90b:4a11:b0:39e:6c69:34d4 with SMTP id
 98e67ed59e1d1-39e6c69367cmr853870a91.56.1789758937665; 
 Fri, 18 Sep 2026 12:15:37 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:317e:3514:d7db:974c?
 ([2603:800c:7900:ed00:317e:3514:d7db:974c])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-144d55bfec0sm716947c88.7.2026.09.18.12.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 12:15:37 -0700 (PDT)
Message-ID: <5c8411db-981c-4222-9b53-7ab9a199cf2f@linaro.org>
Date: Fri, 18 Sep 2026 09:15:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tcg/riscv64: Set vtype before whole-register vector
 moves
To: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 daniel.barboza@oss.qualcomm.com, joel@jms.id.au
References: <1f02f0fc-fee2-4722-9798-97bb0132561d@linaro.org>
 <mhng-2ECF390B-6BDB-4DF3-8133-18F4AC3A4DD2@Palmers-Mini.rwc.dabbelt.com>
 <aq184D2BedTg-Jjc@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <aq184D2BedTg-Jjc@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/18/26 08:10, Max Chou wrote:
> Richard, I have a reproducer for this issue listed below:
> 
> —
> The reproducer follows this flow:
> 
> x86_64 `ls` executable -> qemu_x86-64 -> qemu-system-riscv64
> 
> 1. Get x86_64 sysroot and `ls` executable from x86_64 host
> ```
> $ podman create --name x86_64_container ubuntu:24.04
> $ podman cp x86_64_container:/ {x86_64_sysroot}
> ```
> 2. Cross build qemu-x86_64
> 3. Obtain the riscv64 images (I built it using buildroot with
> `qemu_riscv64_virt_defconfig` config).
> 4. Boot up riscv64 Linux on qemu-system-riscv64 and mount the
> {x86_64_sysroot} (and the qemu-x86_64) directory.
> 5. Execute the x86_64 ls executable on qemu-x86_64 in
> qemu-system-riscv64
> ```
> # qemu-x86_64 -cpu max -L {x86_64_sysroot} {x86_64_sysroot}/usr/bin/ls
> qemu-x86_64: QEMU internal SIGILL {code=ILLOPC, addr=0x7fff8c076450}
> Illegal instruction
> ```
Whee!  Thanks.  An ubuntu 26.04 x86_64 ls triggers the aforementioned 
assert on a riscv64 host.  So, thankfully, no double containers required.

I'll report back...


r~

