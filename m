Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC0BC282EC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 15:51:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuCjy-0008Vk-8X; Mon, 17 Mar 2025 11:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCjw-0008Ue-11
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 11:50:56 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCjs-0008GX-E6
 for qemu-riscv@nongnu.org; Mon, 17 Mar 2025 11:50:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so3869102f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 17 Mar 2025 08:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742226650; x=1742831450; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l0kvYVh3QIIhVSteww7rz6e6dOUJeoxVvK2zu9yWA2A=;
 b=mnv4kohNSqAUpsu9pvMJwaASgZSk+GaSt0Gx0yzEP0mqNaUMzMTT5yHDs9ZoEkU7Bm
 urzJV8yOYY/xERvvYZDbpXejxGtOtoAb2I6OupE0EF9bCy5D7JrELQMb5MbgpvPs8M9e
 j+qXwlbigQmjt+40foOWTKc1IEeuZ/3aOR+abq7MgIKb+WhVIXjCV4MQmtgLl0SZ8r7z
 dKaaemYlx3FtJ8Esk0Q+6HY8MI/qBr4w3ixZf0Z5xVPTqCldgslpeyoiliTqLCfATojw
 4kDU6xqPVnMurhCjZQJth2Vbztw4NQ5tAfepjw/UetRtYhnP7m3baDwRgBc7Pg6MGHCi
 Gl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742226650; x=1742831450;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l0kvYVh3QIIhVSteww7rz6e6dOUJeoxVvK2zu9yWA2A=;
 b=EB9aElVm4qIKAiXr/1/mOWzPlPPRLd3mOMD7AQT0lOIQdbxxJvgaJa1sG7gLd4KpRn
 IRwr6eMJdJc1lGaB/O5Gvudg3/vpQOX9QQDn+j+5cW4wQ4ZbAyKKhtxXZ/iRnmutnwdM
 Ng0FB6muOR/AUJnOMynEymSTWLGH/IneAuuOu7ofWgHo0Ei0gQrZWhEdVdR71qwGNXWW
 jJuy2x0kvxGZz+HLWM1RQhByyHJQdCH3iD4XEAlKrXZd2Ib5r2wIEs4XxHnNla3lbiKd
 cUVwbb+DJxsP696ws7D/rsyzGR7HifC5TNYF+7PTn0KPrScEJ7czMMWXnaRuSRQYPZzd
 AYwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKGB2Rs6wNfrE3IzeAg1jhQMI/otWYgARmcg3fUzEe03xBIsO9210C7zFI/rH5T4PymRY3cDa5ote+@nongnu.org
X-Gm-Message-State: AOJu0YypffONQRPuRvtDvQi6B9FHvVWMuZD79DDQHTQpbLGbf7PT5GXT
 PGI16nV0xovsQgwTHAbVGskRgeriS3h9AxTuQ0J28GnRKIs4xayk2GJyqooxNZw=
X-Gm-Gg: ASbGncux7TMFxr/UpicNDNADN5GLsys7ZdHVoEatrpJI4n8GZRAg6iTBIjpzCk1tQY/
 FCveUVT7VhmBAg1O6DyG6Jswv6f1wV/9ZQ5xbpuQGkO8B8H37KYAxRIorS6EumjWfusdpWukk+D
 7WSaWwsRs9K3+KdSAd44lf/qVFdjKkz909ntoy8xiUPWM/6yGmHSKq91ub2e1U3fFFfiJkvMN6k
 B+DOTkmQhvD6QjIK/GgHhQ7qSvdvvq5dDTek/kJt5PmHUiJUOk0S8Tpp2j22xSfH5Z85OpHyOS6
 5YrtGrHPobSQmKXA644TkO82K8RdSbzKNg9+5kVtNxqo6awFkoRmmmoW3YvCT3NxoKKHS86VLTe
 w1UwbQbmSYGPKshMgS/yD
X-Google-Smtp-Source: AGHT+IHEeSmQycdcPRPilEPN46M2KLx0DgnGBUIOfvhqo+t3Qgdzg2qlN331n14zj9svwQlA5J6N9Q==
X-Received: by 2002:a5d:5e0d:0:b0:390:ebae:6c18 with SMTP id
 ffacd0b85a97d-3971d237919mr9793052f8f.12.1742226650139; 
 Mon, 17 Mar 2025 08:50:50 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb93csm15132825f8f.86.2025.03.17.08.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:50:49 -0700 (PDT)
Message-ID: <ad7cdcaf-46d6-460f-8593-a9b74c600784@linaro.org>
Date: Mon, 17 Mar 2025 16:50:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] exec/ram_addr: call xen_hvm_modified_memory only
 if xen is enabled
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <20250314173139.2122904-12-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250314173139.2122904-12-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 14/3/25 18:31, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/ram_addr.h | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index f5d574261a3..92e8708af76 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -339,7 +339,9 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
>           }
>       }
>   
> -    xen_hvm_modified_memory(start, length);
> +    if (xen_enabled()) {
> +        xen_hvm_modified_memory(start, length);

Please remove the stub altogether.

> +    }
>   }

