Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06251C8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:42:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZF8a-0006Cp-Vx; Tue, 08 Jul 2025 16:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZCPU-0002Lt-L8
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:47:56 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZCOA-0004AM-4p
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:46:45 -0400
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4a589b7dd5fso74629441cf.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 10:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996748; x=1752601548; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JimOaRh7w1crCNK8S0djdsSqbjYIJJWl3DwQcYXioSA=;
 b=VI0Rzp1DyArRzKFcFbnKIHBY3U/YphkaMHVF5STs4uN8/j2rb6Q5pofSyLvucDrIqC
 mE+yJD2eicqF0B47nCLYo8MqhtSZhBmmV0ge5lx4RXJE+5LH105RrNTRsnlzBFv/MbPD
 tNyoAPVKu+jQbcp7N83Zx25EX/XrPwBRTo4amwADV4g77IiUwQFKe7pQsP4seROK3CJf
 BSPcZdcWfdA/99hLSwtQmuAwjKpboG+bSCP9WDy02CPj6SHR9ybk62Vj/Men73KXkk17
 1gkXMnKqLrooDh7QzcpzA3UVjqFVWgm3ivNkmRJFTdxXmkr91sTX8auDuUG0IOH53Jao
 bO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996748; x=1752601548;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JimOaRh7w1crCNK8S0djdsSqbjYIJJWl3DwQcYXioSA=;
 b=u6n2nWf9P+Rd5V2xcalpVSQpS8uAJkUqT9WxzXvaQbfx8t24t5tiOyNlo+g2OEdnr0
 5BSruaczXJv9b1POkPhMv5PJdmMlux+NHu0gv70KmLj6VdEtaurzMylTBk1DdLD9ezaS
 qMYZlVag8YqgK5lcAV0jQDdiCaXdGF896gbdxWCcVjEAD049EBUp6mmecNlOghRiMB2D
 BLGG8UYcSg7FscZgyjb7tM9p2mjvNjDT6Eia3pVfkubHWbhxm8fadsTbRhVHDuimK3Yk
 wiHFQh40KORqBB7h0o428YyQk/uDnZh9qlwJIn3yuzA1RwRiwBK4eu0Hq59BhFu2MBIn
 tCuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb90fobVzdLOt3m2v6IBPewWYqgJmB+ThFyo6W0DGiyKihGqFds342GDehlmiPpwCdGoAIAjphVqhi@nongnu.org
X-Gm-Message-State: AOJu0Ywgbp0IvRp/0unTP+EbfuMrws+yA7IttBRP2JdUG+1wLZ1isuin
 JqH21FZrQoZJ346KU2HwOTNMV0TzcJmvsSYAXPbDmyluSK8aDwnLVHRHvkWwWah6MG2ipfr7Jix
 6CCIZKJI=
X-Gm-Gg: ASbGncsY4D5Y5em/0lDA9JBXQ9t+PmTlxXEecyCB6fsU67XCNxliqheSSqawmhp/qBf
 wq9XwgvAMakJoMcPHHOlB0LF/ehSqRzLhgPmQwg6Fs4JXzs1M13CRQ+wwXRSZ6iugBaiGMEbh/w
 xG7UtwoM3UAM5BOY9abtnjzgKSYyKUmPTN/Y7pHO9RnJ5fa2K+cMRqT5p/nhI2HL2MIDIhjSIsb
 Fx8qziD2BDGahGosoHUFxYapMWnClUENZkyWBKVS9j8YPaNSeJAIbIxwlZjwfLdavwwu10aLiSv
 IkdKkm3Nc1Q+6pwhKDZVALUJbFvGAv2zKm191h0gqnOjNNsXxwgsSBMME+e5Zm9FKnkbCaPbeJv
 6qPCNA80VZKlKl//dFDPu5lJN5s10A3YoLj8W4oBU
X-Google-Smtp-Source: AGHT+IHEJP3chP/POsRiyKFxdUz6AF25XSh6D5xzjfmBJquIIary/g2P1/FFAYG+bT4Oi0RyduYPdg==
X-Received: by 2002:a05:6808:80b1:b0:40a:72b7:d545 with SMTP id
 5614622812f47-41110f0c3ebmr3580385b6e.38.1751996410484; 
 Tue, 08 Jul 2025 10:40:10 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40d02a43d64sm1742229b6e.15.2025.07.08.10.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:40:10 -0700 (PDT)
Message-ID: <d52695e3-0d52-48ff-8402-c9b9fd892cc7@linaro.org>
Date: Tue, 8 Jul 2025 11:39:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 5/8] qemu: Convert target_words_bigendian() to
 TargetInfo API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250708171949.62500-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/8/25 11:19, Philippe Mathieu-Daudé wrote:
> -/**
> - * target_big_endian:
> - * Returns true if the (default) endianness of the target is big endian,
> - * false otherwise. Common code should normally never need to know about the
> - * endianness of the target, so please do *not* use this function unless you
> - * know very well what you are doing!
> - */
...
> +/**
> + * target_big_endian:
> + *
> + * Returns: %true if the (default) endianness of the target is big endian,
> + *          %false otherwise.
> + */
> +bool target_big_endian(void);

Perhaps retain the warning about not using this unless necessary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

