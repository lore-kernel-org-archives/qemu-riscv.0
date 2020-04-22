Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jR6iC-0005iw-DS
	for mharc-qemu-riscv@gnu.org; Wed, 22 Apr 2020 00:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6iA-0005hn-4G
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 00:10:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6i9-0004Vj-4X
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 00:10:09 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:54509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR6i8-0004Jo-Ip
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 00:10:08 -0400
Received: by mail-pj1-x1043.google.com with SMTP id y6so321987pjc.4
 for <qemu-riscv@nongnu.org>; Tue, 21 Apr 2020 21:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tn+5ouqZ/nFw6AJn5FYDTOmMdDVPTpChXAu3ttF/t2c=;
 b=Hql3zhdPBI6UIK/N5KtVDO5lDBjpZsyqxfXOvWCCp7vgPVRsan6D/374kb5nzz+Unl
 MQ2BTh3XGj90bGsyaaIhnZbg/hSeP+128h7OCxPULNgOlko/2WB7+bCbaMp+BTHXMpPI
 WFqicBOJQ8hKMcGbLg84VUV476NWAHW8A/J0/0zmGLmB67k2WDq4ND8nsKCjzOAU8TXi
 12MywdpRtpBC1d5hlSqsk1RLrHlRqFQUr0peipfCgwcDlLWzKkOleJqxLD3/qbxjcg5F
 3jGcsfezOEm/9CSk8T/jIW8/VB1lD71gFRwmDbiDqwfy/nyNMU6LI3DLHAzQylUR70ao
 e/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tn+5ouqZ/nFw6AJn5FYDTOmMdDVPTpChXAu3ttF/t2c=;
 b=olNTqlAlTeLw34jzaZblXAhMLcs7nY47ah5UV5qpFm2GvBPk4X/iSibAvkwxl53HLM
 6VleM7fdnMtfWVvf8om5nyLElEGUViRCqhkebny5Iyd4O3Uw/4ClgJqRZ84EudwLgOUS
 lpi0LydR5mN+gAoxquq7zcoNJUOIhzh2Ybv4eK+zfLBcHMQlbl0/Co78ui6UL5fUsd7m
 GAHnM2vz9sUF5d5uXBUrwteVTymvXxClos5G7xAH8dbOPiwpDGAQBBBUdbbUAWO/zQvI
 An1OjdVesvfOx/fb+z3wrkrI/LjG/AGBDROnHsoYC94DwcFf34L4tmLrulAC7t3Cm8G0
 z8nA==
X-Gm-Message-State: AGi0PuZYx8PERPCZUSeDVaPfI/tm2WPer01TJSpdIVbzxmWJSLbjtegk
 NsWA9m7UtZZk1p+BEsxBC1jqLQ==
X-Google-Smtp-Source: APiQypLVE18+yp/yge25hKZWHsNL3TnAXf/jNjIlWfRqycuK78tAq/DgbgN2+j1QsEJVHCFPgyqrhQ==
X-Received: by 2002:a17:90a:6f22:: with SMTP id
 d31mr9479458pjk.14.1587528603108; 
 Tue, 21 Apr 2020 21:10:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id y184sm4064768pfg.127.2020.04.21.21.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 21:10:02 -0700 (PDT)
Subject: Re: [PATCH] linux-user/riscv: fix up struct target_ucontext definition
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, laurent@vivier.eu, riku.voipio@iki.fi
Cc: Alistair Francis <Alistair.Francis@wdc.com>, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, wxy194768@alibaba-inc.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20200412020830.607-1-zhiwei_liu@c-sky.com>
 <f6dc4fa7-fed5-28a1-5922-68e9a0510de5@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf6b46c3-cc39-1b4a-4ae4-9de894721f04@linaro.org>
Date: Tue, 21 Apr 2020 21:10:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f6dc4fa7-fed5-28a1-5922-68e9a0510de5@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1043
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Apr 2020 04:10:10 -0000

On 4/21/20 7:34 PM, LIU Zhiwei wrote:
> Ping.
> 
> When I port RISU, I find this bug. I can't get the correct registers from the
> struct ucontext_t parameter in the signal handler.

The RISC-V Linux ABI will need to be extended to handle RVV state.

There is room in your sigcontext structure:

> struct __riscv_q_ext_state {
>         __u64 f[64] __attribute__((aligned(16)));
>         __u32 fcsr;
>         /*
>          * Reserved for expansion of sigcontext structure.  Currently zeroed
>          * upon signal, and must be zero upon sigreturn.
>          */
>         __u32 reserved[3];
> };

in uc->uc_mcontext.sc_fpregs.q.

That reserved field is going to have to be used in some way.

My suggestion is to use some sort of extendable record list, akin to AArch64:

struct _aarch64_ctx {
        __u32 magic;
        __u32 size;
};

One of the 3 zeros could be the total size of the extensions, so that it's easy
to validate the size or memcpy the lot without parsing each individual record.
 The other two zeros could be the first header of the next record.  Which in
this case also allows the payload of that first record to be aligned mod 16,
which could come in handy.

Talk to the risc-v kernel engineers and come up with a plan that includes room
for the next architecture extension as well.  They may have already done so,
but I'm not monitoring the correct mailing list to know.


r~

