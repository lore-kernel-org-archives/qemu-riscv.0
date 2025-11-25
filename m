Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4816D0E6C5
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 11:05:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqqt-0001ul-Vn; Tue, 25 Nov 2025 06:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqqs-0001rC-D4
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 06:04:54 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqqq-0002i2-FH
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 06:04:54 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42b31c610fcso4590326f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 03:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764068690; x=1764673490; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iO0kN/gBhlAMM/PU4SCRVIu6yBy8I5UFDsqZzOpyzrc=;
 b=B6kXfYKT8/dq4cXHu1MJKj4u2tFFZ/vDhlRc4exxa9uO0Ohd8XlLuSotJvsvZoF9oN
 BllfcP6umsCxZuHpis8Ahn+zzsvYLqIkPstk1MvnUZilwjaokEn6GG26+Nlo+s9AT7BM
 FUkaBNSaMGHkep+lDprWwMGJHLSoPk/RAUNzEh/UOL7tZOhQ1gTN6uN//pKefdTt3kYx
 JlGl54HveCNvnbqKRsjkbANsSzwc34cxrLrSjxpjccKxavtuK7E1o0VErcUc+gmWpJ+m
 p/m6bSoSgx8nENo9sNj/XhvMSJgbqyDNcGYkwojz+H8y2Q170D/0GgTFE6rbE2slj53z
 xEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764068690; x=1764673490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iO0kN/gBhlAMM/PU4SCRVIu6yBy8I5UFDsqZzOpyzrc=;
 b=QAVw7Wa5tQwRe9X43+WFHKL5ukTMg53NhaUll4ScFWPMFx0g4H3uQXWsG5EfALaEf0
 0IcvoGH1634gmiRfJKPx687y7Kujfzr9ch4t8AVOWkFSOqajUYFqbTFZOTfJ0hnOzyCK
 sx9IfGlxte60riu8CSstFNZ4cBfz86jcEVL4mP0y/WnQ5FXCaTBJtqcc/5oMSIaITYX8
 IQbot8KMto4XebSr/ulRASEV2L+Wgu1u4d3nIOHzJBQRVbQgNlHpZqZJ/sA9osRv2dq7
 AUz2W9xyoG+AfetgrQNaCp8NxFimPMigb1ryiRQ1i6Vv6yBmQRjpEcXYXlv96yl89NJZ
 WWtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKWW4Ld00yMkIXhHGyk+SiIsfcMawPLhCC0UPHrqXAOSWVBtkgh58WSo45bpOOF/629XxTecUEd36C@nongnu.org
X-Gm-Message-State: AOJu0YwDH5i1BYxW/sMoI3t+RdejIEgKe3ZJcOSlu+muqYKrebfDWKc/
 aizXaUWaXjsMm6iuCreaXgD0JuRKVN6Bt5FB3ef1uUCv2e8tpuUwbIXwOjrFW3xQKrs=
X-Gm-Gg: ASbGncv5E/dVmZs7uuws1nOz0dDvh6LA2prxPXLtaT+exZC4CG3aAS0I87yRoK7siqx
 1Y8GeODBjSSV7A/4pyJyjLWKaDuVM7b+zOmAU/NpnVSJv8LI7Q1fbJMwd7k4bW8P8pmWLS7wbJx
 +KMBrMqtX2rDkbL6cHlj9Zrc6nFi8Rbi2r6DjK8dqdmQKd3JRU6KNHdMcfO/UFv2p7lbGvdV6XM
 NjxLyuPAdGhFCCVdzWP2eg8i98vIKo8pQR9OxyKWGQb1rcgR7CJi5fTrrkEmVYOxGlFGlueX4nT
 L6qn1YaSUwrMD8w0JnMoKSYz+zzkvNVKF4/XmZrY/tQmPMV6NNEWVSlYHuM7HIapErgB3Ij1QnK
 TUmiJgwJeKX6uun81weKNjQgPg3F/Qj8KzATXWSv7elVgB26YtaLlO9RemiGX3WRRWVpsRqdbuZ
 ercMxt1Xn6rteBc1SZjnVDD/99Z6An96iV9EUmwog/J1CVvZPQJ3Tbew==
X-Google-Smtp-Source: AGHT+IHo+evcKWCvQ8KvL2ckUe1Fj0vCJbznl5VEwtakxRb9+8MQ9HGTEE8pQfQB5yP5912/N7XKwA==
X-Received: by 2002:a5d:64e5:0:b0:42b:3963:d08f with SMTP id
 ffacd0b85a97d-42e0f23179fmr2346393f8f.26.1764068690042; 
 Tue, 25 Nov 2025 03:04:50 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm33531898f8f.33.2025.11.25.03.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 03:04:49 -0800 (PST)
Message-ID: <738331f7-138b-4908-90dc-157e7bece253@linaro.org>
Date: Tue, 25 Nov 2025 12:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.0 05/12] target/s390x: Use little-endian variant of
 cpu_ld/st_data*()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>
References: <20251125105434.92355-1-philmd@linaro.org>
 <20251125105434.92355-6-philmd@linaro.org>
 <b33a0b0a-6e69-4304-b5f5-dbd68fd241a5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b33a0b0a-6e69-4304-b5f5-dbd68fd241a5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 25/11/25 11:58, Thomas Huth wrote:
> On 25/11/2025 11.54, Philippe Mathieu-Daudé wrote:
>> We only build the S390x target using little endianness order,
>> therefore the cpu_ld/st_data*() definitions expand to the little
>> endian declarations. Use the explicit little-endian variants.
> 
> Wrong endianness in patch description?

Oops. Code change is correct however.

