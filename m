Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAA1CAC592
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 13:54:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy9ee-0002Fw-Up; Mon, 15 Sep 2025 09:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uy9eX-0002Dl-GF
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 09:53:58 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uy9eQ-0003NL-IR
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 09:53:57 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-24456ce0b96so48211685ad.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Sep 2025 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757944424; x=1758549224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pP0z3glL9FmWp+3YDaQUiTlaOF5jQcV65GjHjl0DQSo=;
 b=TFTPSVLzwSnA8x+zxomZZEG8CSxbAJnww3mum9cg2ob4mZdjihc0ImXU1XZXs2+JF9
 maBBzo0b771OqhWyWUe5an375bJJP5iRDemj05i/46sfRaXIG8fMjD1Rs3MLqCRydjOe
 nKUg/bECsOqnRfVaRcsY5rtJNyOM7TTwDzBHjeXVSW+Ku/ov+KdF+ZYQrJPlv4bj6weU
 0QIxpALpK/hWAuPn0JnD56HwCuX7yhOrxEoFtJTDMXNAxR+hFQkbexmCkhFTbG0PCBUs
 +NCHgN/QR4h8Cus2OkZBCl7gVDfdgcwxJHnRC7eXG34tyE6cXz5dOw7DKAIA38X+RiJd
 Xeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757944424; x=1758549224;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pP0z3glL9FmWp+3YDaQUiTlaOF5jQcV65GjHjl0DQSo=;
 b=NcLQuydEARGzfQK29CymKWAsq9Ct3p+jBlpfCKKm12NCWW9a7J2lga7GiiMIJyCaTQ
 a5MVMFKcRYmI+O2xFijxpjqZuvyepTBB/E8e4ZylTCQJ4xrN1z2sVi1psX9bRoBje5H/
 8a2GnSPXHhd4BqrSMvLUYbwDcMlOcxAZdTOXaxtcofSTTVY/Y8OwmKDbYroTr4LsNo7A
 yDJCMPv6cZMoKVvVl/xjbBJw2VHcF3/A/o+0I8S/cueAOI/yroBYyT0shxdJBYsyuBCr
 NPV0ewbnMY+YT95glQtJwNrYQRTR6UT3nyj4MA0zrEkKNzQixHGUxzxVaxovjJQCJq5i
 g4gA==
X-Gm-Message-State: AOJu0YwpLrtHUyPvn6fikQeYDxIQEXA4t971W4sbZ+EzubN3J8lZ1OYP
 OUHoRLTtAPJr5Kh/qsCmUL5yP0/JD6mpuryI1hkuFznXPZF3IvwlgbviKtitYLjgxt8=
X-Gm-Gg: ASbGncuIubCCAb2O/BWk+YOq28DbOyPoJYJZSQTLc+HMRZK6s3ArwFOAzhcwtSMxKmL
 CXw8d38QGOzw0XK8OYbFMwq0eORtYqZqDfBk9WeUSIJZ9u+Bg7m71NG56yYXPLBOvoVQsFXcFqz
 diRylvQoJbVWCep1qo5OKIc5+xmt88UG3EFNxOA6Ksg9B0qgh0CsSYeBKRDa9g+yD7RPrSe1x0G
 +52u7pR3Ls2Q+DQwx/tjKYmeZYYf48b42q4rkrVNcEAvU7F6+UZY21mBtdKKrlcjg66ZcuJE8m9
 zylIeb0jZ3KpN879zNlyTmMLtSNGgSfdi/hDy8F0hi/EByTkYOUIqhDOcTn1BW6o4TQDtskSE6M
 2nHf+y0hBnS/csyS/bA54cFp7ozg81emU2EyJGaHQLbykeCyp8jdkfsaxRw==
X-Google-Smtp-Source: AGHT+IHACe5KuVxIMppKyLnKHVwJUZ8hrb1Z8DYNSPw5EEYnlTbWDn/da5/hxZmMk13kdw1xqYIttQ==
X-Received: by 2002:a17:902:b216:b0:24e:b713:adac with SMTP id
 d9443c01a7336-25bae8dcb48mr145429755ad.28.1757944423768; 
 Mon, 15 Sep 2025 06:53:43 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3b0219f9sm130533695ad.123.2025.09.15.06.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 06:53:43 -0700 (PDT)
Message-ID: <8e43c44f-609c-4a30-8559-a5dcb567b950@linaro.org>
Date: Mon, 15 Sep 2025 06:53:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] target/riscv: Use tcg nodes for strided vector
 ld/st generation
To: Chao Liu <chao.liu@zevorn.cn>, paolo.savini@embecosm.com,
 npiggin@gmail.com, ebiggers@kernel.org, dbarboza@ventanamicro.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <cover.1757690407.git.chao.liu@zevorn.cn>
 <1f22506f44570abf3bb17bf144d398807be0ab40.1757690407.git.chao.liu@zevorn.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <1f22506f44570abf3bb17bf144d398807be0ab40.1757690407.git.chao.liu@zevorn.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 9/13/25 02:17, Chao Liu wrote:
> +static void gen_check_vext_elem_mask(TCGLabel *label, TCGv_i64 mask, TCGv_i64 mask_offs)
> +{
> +    TCGv_i64 mask_offs_i64 = tcg_temp_new_i64();
> +    TCGv_ptr mask_offs_ptr = tcg_temp_new_ptr();
> +    TCGv_i64 mask_offs_rem = tcg_temp_new_i64();
> +    TCGv_i64 mask_elem = tcg_temp_new_i64();
> +
> +    tcg_gen_shri_tl(mask_offs_i64, mask_offs, 3);
> +    tcg_gen_add_tl(mask_offs_i64, mask_offs_i64, mask);
> +    tcg_gen_trunc_i64_ptr(mask_offs_ptr, mask_offs_i64);
> +    tcg_gen_ld_i64(mask_elem, mask_offs_ptr, 0);

You can remove the "mask" argument, simplifying the code here.

	tcg_gen_trunc_i64_ptr(ptr, mask_offs_i64);
	tcg_gen_add_ptr(ptr, ptr, tcg_env);
	tcg_gen_ld_i64(mask_elem, ptr, vreg_ofs(s, 0))

You can also change mask_offs to TCGv_i32, which replaces

	tcg_gen_extu_i32_ptr(pr, mask_offs_i32);

which more obviously does not discard data from mask_offs.


> +    tcg_gen_andi_tl(mask_offs_rem, mask_offs, 7);
> +    tcg_gen_shr_tl(mask_elem, mask_elem, mask_offs_rem);

The mask of 7 suggests you're only interested in the low 8 bits.  Which means either the 
load is wrong (we don't need to be loading 64 bits), or the mask and shift are wrong.


> +    tcg_gen_andi_tl(mask_elem, mask_elem, 1);
> +    tcg_gen_brcond_i64(TCG_COND_TSTNE, mask_elem, tcg_constant_i64(1), label);

The andi before the brcond is redundant with the TSTNE.


r~

