Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD41CCD185
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 18:50:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7IAv-0007k4-Ui; Fri, 10 Oct 2025 14:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7IAq-0007hV-9F
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:49:04 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v7IAn-0002Lp-2V
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 14:49:03 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-339e71ccf48so3388432a91.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 11:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760122137; x=1760726937; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D4F5wo0N4x0s4S8JnCM4GSsIsrWrBeTAeQ/FPoVD8NA=;
 b=Wr7gz9fNCJL8q1bBuzM+HH8v3Raeqjv9DXWozuLTDzv5hNxIbMv1Eielrgt4nowUO1
 kDNgQ9//Ud0Cr20ySE2g2kjT2mjKUc3kM1Nw4ShHt77eRVzk7irpEcUSV8evQY+1FU/8
 UfSsuoiU+h4+atvGcJCttNWBRrh/k3i5yx6YttSJ5QWifBjT8FBtGoD1u8lgSwYKPXd0
 IwHB7XJbsUTZ/xkjxb/0rCmjyANGhvq4qWxXe1IAPUg4fu6SbkYzad/OWDkRUfdue/WS
 5w2jqdXrqm6C4pwv4Z+03y1NN9bvtPRKi/+1wyPw3Tyq6hCbUlUxT8+bP+h3x4xntg+W
 H1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760122137; x=1760726937;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D4F5wo0N4x0s4S8JnCM4GSsIsrWrBeTAeQ/FPoVD8NA=;
 b=EgSurbW0fgUBu36vJn8v007ktiisvQq4btiAx6Azlbha0vghDjObGu/gHzsNysrdlc
 OSspBIsH4BM2awpNknF1jA4e0GBTT44ni9kHRFfW2Vul5q+dH0/hQwCWOtjO0lDv+rI5
 Rw0s3d080YLA3hLaFhKaX68wFCOb6ZqWYeVQKhqjY+FElKBn9h4ZKdeTCS8SNjVIccCp
 hxOCS+Rf94pB/mvnhHCI5+lKCo0T0Xa2pvybYIxpiWeORz26y2lpbGIJNWAZq7QtnECC
 5ZWIpeQCF3Ave3lokdwv7MSGEltxlunHBnr9ZI7FwUH8LpdMF8wBWyYbrOrtZz/qE18A
 Ot8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGtAMUKyFV0bWu4dJM+tiVFpQCLOKlobJrCIfdzfDmiFjzWmIAlJvi+te6RLcyEKzmSQPHYkPFfbMp@nongnu.org
X-Gm-Message-State: AOJu0Yw0faClJcqVThY0gvJDP5VWNXOtV3pzQk6VcgXyAvyfnC50bjO9
 3GCK0veAS93fQZ0q84oD/v2DsG44lZxYu3laE6yZUMHdbQIcocshbIjZwO8joPTAK7M=
X-Gm-Gg: ASbGncvz/y8xmrDzO68kjnMNAbsJVRG/ccoaqg9tapHzlZwG+MRpjfkGzDNKXwvjFJ6
 vJnA5FPLQVhk9R8/noxGji/oGOvcBbWfn/ChgzgG9GvqRjUPDf/FXtZ8VzDeQAfrVtH0Op/A0JL
 2Ao4Wd8SDJ3J6GLRZV00IH5aJesWebn3HfXzidLZg41P7xWwi9ERB3jIl6HRAsAH1BBF2a21mBJ
 anwgj0GKlFnJx0FobpYffyjCpFEthmxyydQmfOTyxv52cbrcQxgcBMbYv5z2C5ADjmDmOP378cN
 fnIGcRcFutpqQjW51VOFzgvZg0EE/cHLV0vOzb1nnIFQZ/VWV5nMzu7xoVXSdT9TvajVp4GwXjX
 HFxLUzB0M49SZkePlk1MNwHhuIOtpQUl6Q1o53x4nEQ6pFFngKinI/NYCbKd3+Jg63onmSg==
X-Google-Smtp-Source: AGHT+IFY9VJGYgQeGe3EvpXRrjHqLuNqjCT8Po0uQQJLNKOW7GoDzEmn3C3UQWj+Mus2A/K1Lf1LrA==
X-Received: by 2002:a17:90b:4b0b:b0:32e:a535:4872 with SMTP id
 98e67ed59e1d1-33b510f8f79mr17045947a91.2.1760122137436; 
 Fri, 10 Oct 2025 11:48:57 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac7cc0sm3938948a91.19.2025.10.10.11.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 11:48:57 -0700 (PDT)
Message-ID: <41020416-78f2-4653-adc3-d4b6d3720de8@linaro.org>
Date: Fri, 10 Oct 2025 11:48:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] target/riscv: Conceal MO_TE within gen_load_idx() /
 gen_store_idx()
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
 <20251010155045.78220-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251010155045.78220-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
> All callers of gen_load_idx() / gen_store_idx() set the MO_TE flag.
> Set it once in the callees.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/riscv/insn_trans/trans_xthead.c.inc | 34 ++++++++++++----------
>   1 file changed, 18 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

