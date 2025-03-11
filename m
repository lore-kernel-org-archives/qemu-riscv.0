Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228F6C28B2E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 07:36:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tru9v-00080L-Av; Tue, 11 Mar 2025 03:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tru9q-0007zv-Cz
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 03:36:10 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tru9n-0000yi-1G
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 03:36:10 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3911748893aso3092340f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Mar 2025 00:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741678564; x=1742283364; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YBDtd+wGYXepiPCUvcu8NxohmXbd41Si0c1Rztrtm0M=;
 b=ZGTObIb6KwkgHrmD0Id8CDx326+Ic1rDzMAlv+SF+Z16idvHVCHR5qPkKg00OZyDln
 vOWjrKaHU6WgcPkYmoPCnHjID7BGr7RDgefTy54J8oTXBXCfUbsILrYtAsVSnWGYp0Fs
 QK5yQRBpGaQm3Jh6jPhHtSPmWuItG/xekMlmnrpwX9v64uJztxaVKGwTiJ8mFAmPXrMd
 jH0jhwmEP6SAFbNwl12czisQiSSdTEXsT/Yue21Isoc/6mZfBmW0yiVGb5LBv6lRcLFN
 hbQe+PldnXylNiD+x+Jgj/N0fQypgy4ExUBY3Qc2TZrY2QQM79WB/gDvk/6XaHXNc4Vd
 sFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741678564; x=1742283364;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBDtd+wGYXepiPCUvcu8NxohmXbd41Si0c1Rztrtm0M=;
 b=Ga4lFtjq+yeZeIiONkVjZ5s3xGPM5gzP6yAAy+WYTQGiv1m3ElW4XKeiSeadWK1+Ji
 8fTZYRA8nX7khp0lQC5nhpFzWfffn/ogkU1DcwIGYUTlc89oZqDRLIDscjBJFltyGlqC
 T9x5Dc6BUSzACoxXmKwzBQhjkWh6+2SU1B0S9uwTg3zwmSt/6s6c/LzzN9NiI7OyYbBl
 Jn9CIunyUEc346VMC6mmqk9GkM6rTR2ZeZ5MmoUewPVD0bJ4fVn3qfCkNo5F3TNou6Ne
 jhEtT6xz0w8UpY9elct3l2InRyUG4JKWefKnPO7Zh/NLaf4p2OWxdpTRIvrtaWd+dA39
 +3wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjMqb3d4U3ysqtDIQDIFW5f0hrUUio6xHW1MpvlJLymeWcpvQhJ85m8F/scS5bij05SR+5tRPDyXD0@nongnu.org
X-Gm-Message-State: AOJu0Ywir4knR9DsK3HVi0sJjHV+d3DokY0flu1vdZg7mCEs3shlCbVR
 DDhUzBiEIp/I8ZuKc6W15pAD598OKtHQ9K1h7ROU6OulpqEIG/a98ILW+YVJjf8=
X-Gm-Gg: ASbGncvwi0OVEQM636TlHL2KjfWzCtpwG2J3vReJQlZXAJ6mnSw9VuIUgn3NbUHLsFX
 v8nv9LdIl44kOPyVz5sO0uwg0W011BO//PuGbPmOoH+HmZ/Fs5ArmLVFcdtFNmMdxxJtl6uftru
 xecqfHUCyntM9PNtwQ1NNhTYFQZsd9FrGgA3SRt/k5jXNNLDhGFGWF1u3HM544xlJBbPgcHT2hy
 L/IRxtmbTElOq3Tx22GPueqDxnXqAlLA5AmvhOw5u1S0Dfnuh3oKMR4yPXZSiR4vBCUHaWx9pzZ
 +CQxIdLIx6cQ9CvjVEMoExmxoAS7n/iWcZaon88EACa4eCViPH/IPUMeI8JvprDFNiEc/RM67IK
 RgkELxjB3Apvi823nZJmaxfc=
X-Google-Smtp-Source: AGHT+IFSPGz9/gfwsiFYEmt/RzI+9DcM9u3J2MgkQs5at33CHQLyaRLSm47Zlzsudug5b+arJ/EAbg==
X-Received: by 2002:a05:6000:188b:b0:391:496b:5646 with SMTP id
 ffacd0b85a97d-391496b5792mr6565392f8f.28.1741678564530; 
 Tue, 11 Mar 2025 00:36:04 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cee67ae5esm91023745e9.33.2025.03.11.00.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:36:03 -0700 (PDT)
Message-ID: <b8073e25-ae8a-462b-b085-84c471a4bf5e@linaro.org>
Date: Tue, 11 Mar 2025 08:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] include/exec/memory: extract devend_big_endian
 from devend_memop
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-15-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250311040838.3937136-15-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 11/3/25 05:08, Pierrick Bouvier wrote:
> we'll use it in system/memory.c.

Having part of the commit description separated in its subject is a
bit annoying. But then I'm probably using 20-years too old tools in
my patch workflow.

Only used in system/{memory,physmem}.c, worth move to a local
system/memory-internal.h header? Or even simpler, move
include/exec/memory-internal.h -> exec/memory-internal.h first.

> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/exec/memory.h | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 60c0fb6ccd4..57661283684 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -3138,16 +3138,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
>   MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
>                                 uint8_t c, hwaddr len, MemTxAttrs attrs);
>   
> -/* enum device_endian to MemOp.  */
> -static inline MemOp devend_memop(enum device_endian end)
> +/* returns true if end is big endian. */
> +static inline bool devend_big_endian(enum device_endian end)
>   {
>       QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
>                         DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
>   
> -    bool big_endian = (end == DEVICE_NATIVE_ENDIAN
> -                       ? target_words_bigendian()
> -                       : end == DEVICE_BIG_ENDIAN);
> -    return big_endian ? MO_BE : MO_LE;
> +    if (end == DEVICE_NATIVE_ENDIAN) {
> +        return target_words_bigendian();
> +    }
> +    return end == DEVICE_BIG_ENDIAN;
> +}
> +
> +/* enum device_endian to MemOp.  */
> +static inline MemOp devend_memop(enum device_endian end)
> +{
> +    return devend_big_endian(end) ? MO_BE : MO_LE;
>   }
>   
>   /*


