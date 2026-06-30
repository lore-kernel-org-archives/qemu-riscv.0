Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44DDC43458
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 17:31:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wecIp-0006Fd-Jg; Tue, 30 Jun 2026 13:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wecIl-0006F4-FJ
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 13:31:15 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wecIj-0001E0-TX
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 13:31:15 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38005a36edbso1438243a91.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 10:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782840671; x=1783445471; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7UWriNjdBHy+vVuTzwHGm6RzrjBtfocwaxBrddTQDoM=;
 b=rWfqc3vy4FqjmG3y3iYtzUh8hllXuEQCFZGAJ68maZGOv9CbcmV23OAXLBGKc01B6V
 V6vWImZcDjENw71wCFPVisaAv8DvoSVKbRdkjL0qm8tep61pm9hvEVneJKfwGgMyEiyj
 kEUS1PqJRR8++a4pRFwOvDId2JyTis/ox7E0kT7RWfNm6XzSNdWxAiNkkctxNBZG5izY
 Yy+aX/PO/uoOldDvwAjxfmAJx2K2CO8rQkvffv/79Yb+2QoBzf6/IrTH79H3O//tkPUF
 kePdwz/w/YLcwjxEMUuABqxpXmBC32a5fiudErxqkwqAVWs0zyON/b0c8R+tvCP3qo1j
 tgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782840671; x=1783445471;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7UWriNjdBHy+vVuTzwHGm6RzrjBtfocwaxBrddTQDoM=;
 b=ALQ8HRhEaembz1ohna7gg93q0vheWPXDPk3ag7DadvZH2jWqPUxafxCehHtuS6qdnx
 k2JDS00b3DQsimJGNPGnMZ8SmQ6AIY07kAq9fP7wcPd7U77v87msNBKd7phrWCw3hbM7
 MX9gJeUH4cF6hReIbyHlww2OjtS1TGC0s+7dw4UZz2OEY/Gk17mTBJvvHMjCXc6Gf7aG
 GxaOx+XSGfGPC7RbE3R946rEXHDiytq4ClYtBNXMx3OgbDOFrVUVNyKCX06skVS3Ju1z
 KyX1dW4Gbk62tF4x4kUHN1HIBqWgIOuTatYLP6LT+//YUaYug0PieOQ5EnNk3Hrw9gR1
 2g1A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq7kwJHQoWZx27BC2zBhMJHPeLwSdBnnVp2p1Zw2EqjmK2xFm8y9VBF2lROWJXzEIAxThqN4uBx94xM@nongnu.org
X-Gm-Message-State: AOJu0YwQSToI8YWxs7MRaoWlLJiq/n65d+rSg2hWW8GijjD09yDQ/HQT
 DJwJCSNOHXpfAGalivL/tuZm8ex3Ys3YHN6HrwIzEzAFqULQ0hmIYTvJ05Ay49yiVFg=
X-Gm-Gg: AfdE7cl7Z6kwWNzZTQ9oh4ogIpU0zkfpjQ+zDMuWmvBoaa9hFGwttezp4aQLJ/Sz7vj
 iTBNwDqrKYIUJkIuozLHxPsWr+9UPkNfBr7bTAbqh4/l17ge09+tSG4S4famtUGjyVYWPuKCm4o
 pSaZ0xdRd20BW+AOLltqR+RGfRLBsIcoJVhtJ6eqP14CzE60AAWAF8QQl8TFE6zPFfG9Np6A1Yy
 C4aeHHYidsL5aF1KojFITLs46mGhEmFMBQNwFidFC47P0or57Nv6CtL1x3AMku76w91JoNmLVZ1
 QYjwPsxUwlnRoN9VZ277ZqV2RBLYRKVqdpnbzMRskHRa6ljcxeJhfq1AiY8tnw/eqPAE6esYGWl
 tpJAC0ol1o/q2PJfzRPfEpVfgz1X8N9xaJnabZFmTPounhjAE56IR7mB05MbMMB7jBsmpl/JDu7
 iu5p5pGCnq+6gCF/A7x3PY8iZVIGKmkPL1eFbjN/SvwIwitz/1a6qgJXwOJ39EQURqk3Zc
X-Received: by 2002:a17:90b:4a89:b0:37f:eda5:5169 with SMTP id
 98e67ed59e1d1-3808bd6777dmr1240384a91.13.1782840671328; 
 Tue, 30 Jun 2026 10:31:11 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38095d76381sm289863a91.6.2026.06.30.10.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 10:31:10 -0700 (PDT)
Message-ID: <187d9a11-b1d0-44fa-bf91-43b723063a44@linaro.org>
Date: Tue, 30 Jun 2026 10:31:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] accel/tcg: use GTree for faster breakpoint lookups
To: Shivang Upadhyay <shivangu@linux.ibm.com>, qemu-devel@nongnu.org,
 pbarbuda@microsoft.com, mohamed@unpredictable.fr
Cc: pbonzini@redhat.com, philmd@mailo.com, zhao1.liu@intel.com,
 laurent@vivier.eu, deller@gmx.de, pierrick.bouvier@oss.qualcomm.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, qemu-riscv@nongnu.org, rathc@linux.ibm.com,
 harshpb@linux.ibm.com, adityag@linux.ibm.com
References: <20260630171555.114844-1-shivangu@linux.ibm.com>
 <20260630171555.114844-2-shivangu@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260630171555.114844-2-shivangu@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 6/30/26 10:15, Shivang Upadhyay wrote:
> check_for_breakpoints_slow() currently performs a linear scan of
> cpu->breakpoints on every breakpoint check. As the number of
> breakpoints grows, this increases the cost of each lookup.
> 
> Replace cpu->breakpoints with a GTree to provide efficient lookups by
> address.
> 
> Additionally, maintain a second GTree, cpu->page_breakpoints, containing
> the guest page numbers of all installed breakpoints. This detaches, pc
> lookup and page lookup, into 2 different Gtrees.
> 
> Both trees are kept in sync when breakpoints are inserted or removed.
> 
> Signed-off-by: Shivang Upadhyay<shivangu@linux.ibm.com>
> ---
>   accel/tcg/cpu-exec.c      |  26 +++++----
>   cpu-common.c              | 108 +++++++++++++++++++++++++++++++-------
>   hw/core/cpu-common.c      |   1 -
>   include/exec/breakpoint.h |   1 -
>   include/hw/core/cpu.h     |  14 ++---
>   linux-user/main.c         |  13 +++--
>   6 files changed, 118 insertions(+), 45 deletions(-)

I think it would be better to use IntervalTree, so that we don't have to keep that second 
tree of pages.  Obviously, IntervalTree can query an interval, which takes care of 
querying for entries within a page.


r~

