Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C379CCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 18:47:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7I9T-0005Yz-1g; Fri, 10 Oct 2025 14:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7I9R-0005Xl-3z
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:47:37 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7I9M-00024A-OL
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:47:36 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-27eed7bdfeeso29597775ad.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 11:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760122049; x=1760726849; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IQ3GA2jhg9dm+zJqrkOTRUvsuju8bnP32L13v2V/7sQ=;
 b=WT0un4Tobu/b0dQQjIUJjy4O62RrkF5bjcQbVr/ShkyrNZNDHFN0/Kyqme4PROB/Pp
 a66H7K2exHFTDQswCpeIDBFWNuFzXGm9vFh0EIXRyZlGGlkkB3CSQFycefjsx+BG5GCo
 es4r+T+z/YRacHX/icSq0nlarp4I/hc7ka14xfGRHDLoBj6ETijxGz01p48dvU3Xdhev
 W0En9qH2AwEUqNh0nVxNeZv9qXpKiY7EaHozJeeD0nEdDkM76gkuNoqgteoMfNJCTj27
 ae97rhlBmA5pipscK6SagUPSseNeSUvV2MTWwrgTVtJIKFpWhIDphrZTCWRn7bcHmYi0
 dJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760122050; x=1760726850;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQ3GA2jhg9dm+zJqrkOTRUvsuju8bnP32L13v2V/7sQ=;
 b=IHftN3K+1cXlCJVZzJ6gLNXek1AW8L3E5Z6yDolQJ+uGQJulIlZaVhDu9Iwai7rZnu
 2IWvyEccN6kaeCohO1jQp1IP5Yt80CwGmaXtojL7FIoQuS93VHYHdp7/RHcBAP3PmHcc
 VqROD2dK4S2s383oOHxiARVPwdfDI5/x0LvA5+0q2womnfkC3AE0HwzBRXSd6t49NsX6
 zgAkaZhfaGftPw1sfU/3oGvyPZAXNtYsIDxyvuD7aa0d7Mz28+cDOQG+t5H6YPlbnkET
 dKmaRFVFb4fcGb4iAfewiPZ019cFMPrzRsdKZgbxX2shHimqU36Yd7RWQwdQaLMQnFpo
 KpzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRjuKQPJZxmARSmuv3uFwTyMDxGq9hQeqRGIq1WZvwMCIR4Qgj+U+arAT46I48skll2Z+ouVY71QQ3@nongnu.org
X-Gm-Message-State: AOJu0Yx1myTYy5ELRgUVf4uO4cXvfcrB3i1OtHO2hjD8BJD34jwkK2Ti
 xrb5jB4ziTjSLLbnbUKhJoNrhl7xDo5nx07GQUFaq4ZwXwyDgS0zDtUtLqQIrawpqT8=
X-Gm-Gg: ASbGncvllcdbUrGrYAjwF5s9eeS0NhsK/CZkI6SnTpbLAfrNpqu/Xdc1rJKeNV3q+AJ
 ZeijMxW4mCERG12A3AInJ7298AJ5VmO/Z7k1THZQDxvKdmywKSuKsVpbQtoA1D71YRJnyqPfC6+
 4lnqjL38bIvwTtMJUQYakuoVi4PbyXDnoknaoWFKRnWr99zz4hjhsVdv6QLts5aSmqR23URdfT+
 WAyjeDka3aNpk3Gq+W2Y4IFezBd/+AV1IpaHgzDDyOZkuT7IThJtBt7VB8SfH+JkTvXmQn+2Oz2
 GT716UaUiCH0kF+/0Zxx2ilZZAcLAt3nE5j+vHb36B5oaQ0NJMVNl7QbQT6BdY9AvVPGpZQZncD
 D0TLbkqLQ/E/Fell0VroM3DWpyGHlxvvQYzCDBXAUI6/LDx4lOfXFg0aAfiI=
X-Google-Smtp-Source: AGHT+IEBu/iyNS0Xv6uIo1rNeE6+jXMoly795z8i4QZpbQJz3I8leETg3KblcjiRQ/MlMfgz64zHkA==
X-Received: by 2002:a17:903:1aef:b0:27d:6cb6:f7c2 with SMTP id
 d9443c01a7336-29027f0cec2mr160914445ad.17.1760122049558; 
 Fri, 10 Oct 2025 11:47:29 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f08ddasm63233095ad.65.2025.10.10.11.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 11:47:29 -0700 (PDT)
Message-ID: <71d18c36-1c2a-4dc0-b195-ee3755dee534@linaro.org>
Date: Fri, 10 Oct 2025 11:47:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] target/riscv: Conceal MO_TE within gen_inc()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anton Johansson <anjo@rev.ng>,
 Valentin Haudiquet <valentin.haudiquet@canonical.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20251010155045.78220-1-philmd@linaro.org>
 <20251010155045.78220-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251010155045.78220-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/10/25 08:50, Philippe Mathieu-Daudé wrote:
> All callers of gen_inc() set the MO_TE flag. Set it once in
> the callee.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/riscv/insn_trans/trans_xthead.c.inc | 34 ++++++++++++----------
>   1 file changed, 18 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

