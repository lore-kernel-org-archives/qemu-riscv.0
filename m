Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D23C88E64
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 07:30:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x618t-0000Ke-CR; Mon, 14 Sep 2026 03:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x618q-0000Jt-AZ
 for qemu-riscv@nongnu.org; Mon, 14 Sep 2026 03:30:17 -0400
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x618n-0006Qe-2F
 for qemu-riscv@nongnu.org; Mon, 14 Sep 2026 03:30:16 -0400
Received: by mail-pz2-x10.google.com with SMTP id
 41be03b00d2f7-cc1cea4bfd1so1239345a12.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Sep 2026 00:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789371011; x=1789975811; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S7+AL5afegpb0To3hlGT44wY+oi7DzN3AXe14w/8OVo=;
 b=SH5lbHwpU+xvOzMLCxSbmaLXqTdCCCSdGiIUF5YGqmZJ9Q65eL87SRQ47D3LYqugAD
 OIsWR8az3hN8cPpYogVJeinwzQZCFXWwY+WRObq2+duo1zdwTMQ9XDZNiZRKsD9mG6qi
 /XEZcrMQZZRITahnS10TTXT5fcO/qr7xoDGUuzaM2pdgxDpXLUcqVLxzCuXpWWN/y2Na
 kHXU9KEtsVb51g16xKd65ZqnTHGednse0k9ckqYCE1kAMp2QxD78V9RETVGNhSQVIgTA
 oGC2gYd5zkIOkX2g7Tux0rdkY6o0sxHLYK0VhgiuNGzHR8YlgVDfD8dPjUhXRtvrpNMI
 G34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789371011; x=1789975811;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S7+AL5afegpb0To3hlGT44wY+oi7DzN3AXe14w/8OVo=;
 b=CYoopBkqadmLhRQYUxFaeNOiV/O6hYj/ovF8KeYHuNOyWFeZTWpSXFMZLXy1s0O6ji
 No61ztSo8W7Q9bSoOqXitsTe2reu3R1oFeqAvIcqRUnms2PekH+/4VxHckFkTBbM1KGX
 kNf17l8pdP51xKhq8r73rnqhRSnsv7r8IO7AWgeZ38tN/BZpRAkCOiuBe9xRxTYRY8T7
 QYMau0iRa/wdNFzfGqmEVPA0QhKYUnS1L1jVC4OInhOxp36/pFCQ0NqWamL139M8KRmK
 mXaxM09FdnScrYjgpzjpszFsY30UhAzNLdNqIi6dBs8I/TdCxegfnBNGSN7d8FQsehTv
 XI7w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzFZLEYuA8Nvd+T1QmLUGjK78a6oBSDIZWWBnWFlILjsoIZIlEbbWZ8DafcRMv8a4iyFs8SeMxg2AtU@nongnu.org
X-Gm-Message-State: AFuF++nR04i9VP4yBSqGgGgGozSoguP79WWyUHK/Z0gResT8Qj7CAGOd
 ItDlK+3rYZUrA9Bh7O71jSspfxxCwFbx+n322kBOMyO5KKjIm6riTLQ9LlJnx7JCQTk=
X-Gm-Gg: AYBFou00c8nWora6HZxe7xzEjCB/oLPMBuWJHqXS7xTXqixoe+ImgiBODDGiahjqYya
 K8u9ss4jlhFqPmVShARpt/b8DjxJPsqI4jONHLBcFmeTjwAfzhn1YGamcoldFoij7Ofb5L4TAxP
 pjVOs6dfFGXitEwIj4qAFcn9Nhg40BCAkkeiQfrq7UeL+f5C91btB2LTZy5AxAnlisgsLGfESaR
 wZLBU4TpmkINVEC9XlA5F6XZV0WPTE37tU7fRMBUqAydO8ozkmHWX/vJ/zESdjoN7CXKiEjpBRq
 u8uJ8yiJE3T4W5ZIKQaccmOLudU7r8NAeA9EcsIJEEvTpoyRoL0PgOBxyLyqJVNupZixn9QbWcj
 I9M/ywW2z6iEeNvhGE8yoDBrOTCz/G8OiAxkiyeDg4eixqzxRYRx9ino/JnRi6Smx974S4TsWjv
 /JmzCw+E5I1cIyFR4j/L0FY8W3kn/PYAt+4lS9E1D7Rs7Fc91jAWrK36CxTDhjQvms189qLiuOU
 Yh0+L/JjKmoRHR+0NUod0zcJ9L+3Kxn6zQUYwYANuybtNQDdWXXChaiyILsRQ==
X-Received: by 2002:a05:6a20:c901:b0:3cf:a7a5:e310 with SMTP id
 adf61e73a8af0-3db404aebb2mr2897193637.9.1789371011433; 
 Mon, 14 Sep 2026 00:30:11 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:7164:7976:4c53:31bc?
 ([2603:800c:7900:ed00:7164:7976:4c53:31bc])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33bd8ad03ccsm4847348eec.2.2026.09.14.00.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 00:30:11 -0700 (PDT)
Message-ID: <39f55a2a-8cf8-47a6-b218-042f31f4b572@linaro.org>
Date: Sun, 13 Sep 2026 21:30:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/18] accel/tcg: Replace size with first/last in
 probe_access_internal
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-11-richard.henderson@linaro.org>
 <CAFEAcA-MVRya=Y8i+rURHqizQzJLh=Gp5tQxHSK_VNBUQCAzdg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-MVRya=Y8i+rURHqizQzJLh=Gp5tQxHSK_VNBUQCAzdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x10.google.com
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

On 9/1/26 05:28, Peter Maydell wrote:
>> @@ -1440,6 +1440,7 @@ int probe_access_full_mmu(CPUArchState *env, vaddr addr, int size,
>>                             MMUAccessType access_type, int mmu_idx,
>>                             void **phost, CPUTLBEntryFull **pfull)
>>   {
>> +    vaddr last = size ? addr + size - 1 : addr;
> 
> This can never overflow for the convenient reason that all four callers to
> probe_access_full_mmu() pass a size of zero :-)
> 
> Do we update probe_access_full_mmu() to the first/last convention later
> in this series ? I couldn't see anywhere we do that, but maybe I missed it.
No, I didn't do that one -- perhaps a mistake.
This function is supposed to be only for page table walks.

r~

