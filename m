Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6786BC28B30
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 14:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tvH2X-0000Gl-3R; Thu, 20 Mar 2025 10:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tvH2L-0000Fe-2B
 for qemu-riscv@nongnu.org; Thu, 20 Mar 2025 10:38:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tvH2G-0004GT-34
 for qemu-riscv@nongnu.org; Thu, 20 Mar 2025 10:38:20 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-22359001f1aso20694255ad.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Mar 2025 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1742481494; x=1743086294; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CPqMkusrvEx3CgUeocszMiRYOIwA6Z+iZI7BXnS3r80=;
 b=Tih3hGbAujbN77X8S1VC7KZwH80HSmW/Vhyz7lzhxiAS0WurUQdrDf+F2MqYa/6T5V
 uGwjV/a2yV1GgbbCrpotUsKqyKIGLDe545i3u3x/LPTSbEBG2IMKqVYO8nZr2ohinSle
 nfKoRAf3hAQqlnC8SwiLQKMltcUn66kPW6DyxpnenVwV2savINdB7e8pS/LRKRvJex0Q
 oWGsfELCgcckBjwGV26OfXRMlGgKRJTV28UaC9IFNlC/BgpMwjIzAqRXB6nsKh3oCip8
 iUU64B75+ha8JUJRNe1ou+UwYsOgoi22UctJaXBLrqo43ZXoSMQrX2sI/ljCWlItj+df
 xl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742481494; x=1743086294;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CPqMkusrvEx3CgUeocszMiRYOIwA6Z+iZI7BXnS3r80=;
 b=C1vaPt90n9rkGxuyWF0SvjviZqGLO1q3csKZlqeVECdSeQiXaLUnWNLJNA6fA+ipmi
 ImX7j6rwkqXHMSDSGBCEhJ0L7PPMq5Yg4C1G+3PdGH6HpgiNj3OD0annFq6b3gThpwJ0
 EDrZEpFi5IPnb8r+BPzVBXUVVtg0mozJ9cnSojVF6h54MWLpqGRP9AfzK1IWRd8k/3bb
 lAzkhE7qa0brXLP/kvNMQA+VUh9dywFuVcuCR+x889XPPc9R5kYZLWmaSh8Sj74e7sPY
 km9hrtYvOECA8+1HNUo5vUNpO84Ze3nBl2U0U1UXOy6BZh/iT977TFSPC3StBOQuXFBb
 ItxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJYeBiEhnzSvKqvAGqixpdn81l9UqRhHziO6p0jlXJRRrAKifrSmchPRlwSA/paqNEvb3jMc2PvzG2@nongnu.org
X-Gm-Message-State: AOJu0YxgApAHNOAFvMKnYu36apyypTEtQBrnqtDsZk6LJpirEO4qw49D
 uXiYLse3NVv9LQLvft/f+jB1r90tmxxV1Tl7S0duLp8w1BKh+y/dcPE7ICNUTk0=
X-Gm-Gg: ASbGnctKO+wWZ8UupuEO4Y7VS09XL/UsD5j+aVrfGKzxJQi7Z/v9cO+4PCAcXmBusc7
 i4GaI6e2MyQbQcqCnMNlSUgJyMtco9DEoWPC2Msf+vL/aX1mZBVers2r6s+A8zYtnGwWZfiAlll
 6FFcyRKgA+D/adSngLF5sTlocky9jtYW4BRAFDmn0gOS73AcElh1tjU+98f9XtILNT5JOKgWzQT
 ME9cQW5Mbkp5BWcmVi8jM3h0htppJelyOgyxw4/XB4pG192s7RR2Cddeo1QBM+qsqBWrDXELBwf
 fzMtQXO6Oxad0RZpmbm5H7RM8VS6NM16cWhaQ6+G9liNEnOHnpDsq95bUPidmfcRVetCfQZn9mO
 z49jp1KUw1E+KJlDiQU/e
X-Google-Smtp-Source: AGHT+IFpUun4k7fuYxkVmWCB9Db0wuH9pcXww5jmODknYSbuOGy8sUYZqoCZbvG2T4uJnRIEt3ErzQ==
X-Received: by 2002:a17:902:c94e:b0:215:94eb:adb6 with SMTP id
 d9443c01a7336-22649a80a38mr109610235ad.40.1742481493475; 
 Thu, 20 Mar 2025 07:38:13 -0700 (PDT)
Received: from [192.168.68.110] (201-69-66-189.dial-up.telesp.net.br.
 [201.69.66.189]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbec04sm135959185ad.191.2025.03.20.07.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 07:38:13 -0700 (PDT)
Message-ID: <28f15e5e-d9ad-46ca-850d-cd776b9b203a@ventanamicro.com>
Date: Thu, 20 Mar 2025 11:38:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] target/riscv/kvm: add missing KVM CSRs
To: Andrea Bolognani <abologna@redhat.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, ajones@ventanamicro.com
References: <20250224123120.1644186-1-dbarboza@ventanamicro.com>
 <20250224123120.1644186-4-dbarboza@ventanamicro.com>
 <CAKmqyKNmpRA8kphbWnA-AqTSUSGf+koSbCmuk6VgZEWde2NFBw@mail.gmail.com>
 <CABJz62OfUDHYkQ0T3rGHStQprf1c7_E0qBLbLKhfv=+jb0SYAw@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CABJz62OfUDHYkQ0T3rGHStQprf1c7_E0qBLbLKhfv=+jb0SYAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



On 3/20/25 11:25 AM, Andrea Bolognani wrote:
> On Mon, Mar 03, 2025 at 01:46:53PM +1000, Alistair Francis wrote:
>> On Mon, Feb 24, 2025 at 10:32 PM Daniel Henrique Barboza <dbarboza@ventanamicro.com> wrote:
>>> We're missing scounteren and senvcfg CSRs, both already present in the
>>> KVM UAPI.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> 
> This patch seems to have broken KVM acceleration for me:
> 
>    $ ./build/qemu-system-riscv64 -display none -M virt,accel=kvm -cpu host
>    qemu-system-riscv64: Failed to put registers after init: No such
> file or directory
> 
> Reverting it makes QEMU work again.
> 
> My host is a SiFive HiFive Premier P550 board running Fedora 41. Note
> that, since the upstreaming effort for this SoC has just recently
> started, I'm using the 6.6-based vendor kernel.
> 
> Perhaps the KVM UAPI additions mentioned in the commit message are
> more recent than that, and we need to make QEMU's use of them
> conditional rather than unconditional?

Yes, we can't assume that CSRs will be always present.

I'll work on a fix. Thanks for reporting it!


Daniel

> 


