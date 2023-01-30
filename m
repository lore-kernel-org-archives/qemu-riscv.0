Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMMxR-0005uP-GF
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 00:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMMxP-0005tm-Np
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 00:43:55 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMMxN-0005qo-TI
 for qemu-riscv@nongnu.org; Mon, 30 Jan 2023 00:43:55 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d3so10424045plr.10
 for <qemu-riscv@nongnu.org>; Sun, 29 Jan 2023 21:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UX/xnewUGY/tCtBu4Z4GPmEPV9XOCWCsqbIcHA6j5oI=;
 b=iimcB6C4xkwBJ2i5+AFfIq5HYj09JvQb4Yd2WRTXMhL2oLycST6RmPqkh/OaBC3aFp
 CgzECp3Rd+76PqBc1Wsu5zkBtjKG4XfEJEYAEm9HNBJxIq8AYEG8Y6p+jvfMNbNrCbCd
 vqrky268v/YkYVXdz3xwc79zjNQeHj/ylfZNHT5q9I0x9MYJyq6qIj7Kwfk88NHpOiTW
 7f64nsYRnTKKSo6mIGjKx/xT7AoBXSwhLCgLNBGo5gZmFlhYpPXQVhPBrgYcDxv8Pl9M
 JHwPpsYV1FV3ayZLADC4PSYh8SPzAnt66yYLOuDCfJs5JBJ5/5kIoVPDOJNreqczCIKQ
 digw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UX/xnewUGY/tCtBu4Z4GPmEPV9XOCWCsqbIcHA6j5oI=;
 b=Fpm9fpsgADTb3gWI5Wzxk1bl53XNYrgSBaTcqy1RICcJpREWJQ/9CIYW0VSTq9/dST
 FEhfiNxLtx7P2t3pc1cwbp71+IxPZ/TqjcvgQoCGr6hnO8KJX0XiZq+dbq97j3L5URZL
 qZXzpUs040voiBOuoNpu4uBzC8Qj6OB8yBQ/ObSf6lguNB78rSBScdLKVzprng5Fi8Z9
 2A6OF9jo1Z7sy/cdmRqYjdRW1DkGhVKuHJ8h7SdsBQvTwvupctXF8hNtsYlc38+V1E4G
 APBxsJ6CS8uIu6FWki5TjGZTmOc7doET+TA8Q1//fKAvGBwr75GNr2stJpBYqSJlVN+9
 ZOLQ==
X-Gm-Message-State: AO0yUKVq+/Ku9VJFH0iF0jhdT3O+huBskKllZve50o49m8jUCpPhEEhl
 O4GgzmU9jwJHwV6rut0hxD2Kaw==
X-Google-Smtp-Source: AK7set9rPElhFC5fdm28zakJA6xD54eJNSdwoVIunhECjyiHMoBjV1j+LeuKhVzcZPHPWNWq2HC8cQ==
X-Received: by 2002:a17:902:ce8a:b0:196:2d55:5b96 with SMTP id
 f10-20020a170902ce8a00b001962d555b96mr21413164plg.24.1675057432136; 
 Sun, 29 Jan 2023 21:43:52 -0800 (PST)
Received: from [192.168.50.50] ([173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a170902d3c900b0019337bf957dsm6730888plb.296.2023.01.29.21.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 21:43:51 -0800 (PST)
Message-ID: <7f8383f6-e860-5e3e-e89c-dfdac4e05dc5@linaro.org>
Date: Sun, 29 Jan 2023 19:43:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 08/14] RISC-V: Adding T-Head MemPair extension
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-9-christoph.muellner@vrull.eu>
 <48ff4151-25d9-4b4d-d50a-6516000599c7@linaro.org>
 <8385d954-678e-d78d-c3ae-d74a4a902907@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8385d954-678e-d78d-c3ae-d74a4a902907@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-List-Received-Date: Mon, 30 Jan 2023 05:43:55 -0000

On 1/29/23 16:03, LIU Zhiwei wrote:
> Thanks. It's a bug. We should load all memory addresses to  local TCG temps first.
> 
> Do you think we should probe all the memory addresses for the store pair instructions? If 
> so, can we avoid the use of a helper function?

Depends on what the hardware does.  Even with a trap in the middle the stores are 
restartable, since no register state changes.

But if you'd like no changes verifying both stores, for this case you can pack the pair 
into a larger data type: TCGv_i64 for pair of 32-bit, and TCGv_i128 for pair of 64-bit.
Patches for TCGv_i128 [1] are just finishing review; patches to describe atomicity of the 
larger operation are also on list [2]. Anyway, the idea is that you issue one TCG memory 
operation, the entire operation is validated, and then the stores happen.


> The main reason is that assembler can do this check. Is it necessary to check this in QEMU?

Yes.  Conciser what happens when the insn is encoded with .long.  Does the hardware trap 
an illegal instruction?  Is the behavior simply unspecified?  The manual could be improved 
to specify, akin to the Arm terms: UNDEFINED, CONSTRAINED UNPREDICTABLE, IMPLEMENTATION 
DEFINED, etc.


r~

[1] https://patchew.org/QEMU/20230126043824.54819-1-richard.henderson@linaro.org/
[2] https://patchew.org/QEMU/20221118094754.242910-1-richard.henderson@linaro.org/

