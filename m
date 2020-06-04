Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgwGq-00018x-Rq
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 16:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwGp-00017J-8b
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:15:23 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:36167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwGn-0003XR-FA
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:15:22 -0400
Received: by mail-pj1-x1043.google.com with SMTP id q24so1712577pjd.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2020 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EzVWYtTp9/kLezmxudd6UyLUAdlaUG23E721xpMSfLk=;
 b=P+jxCyqW3THOxDiBPxJkLGpHt8xSUO7oxg2fGk6Ij4o6smo8PeQeqMNPDeCFCfO9Mx
 1la2HyT2uAaH9b4ZwsuRmgsIJP1gz+/gjmRHNp2nAOra3mlELykXW/ZAhL4TrOEiDpUe
 DcgkBgXhJ9FH+JRxamJ06ixRmrBNq99PxD5MW8pYb1jLBzFYGWVjX2PGPQXJEgmJesNG
 uvsgDNfxBa1DIh8XA1ncJHxtbaQaYJgTrfxIJZTUII/Ynv3P1f/LfOyeB0AMANWklZ3L
 UIaMTyaAMxzxShuuTeUagpzwp6ATG1wVC8OcMU2LjUfj8jIkCy+XCWlTlfo3Q1nymBSj
 kq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EzVWYtTp9/kLezmxudd6UyLUAdlaUG23E721xpMSfLk=;
 b=tmbywlXpeiupAkV6UO0jY7IBylcqXI2Bh4LoMU81KtW/SZkT4kmhAf+4M+GDw7YWcV
 i/NC8uUe4FEF2OPIRGhn+WIcbvcbSxDT4FbShIfX0T+vTt6Rx5knXYMPLzc5EaIDsfeD
 YkOO7Aonkhiex8rSxzDFTZzgERBXj1jlvH8di95z/PUk5OjlQU8Oc4hxA9QbdrA64lAI
 Ybysq+yYr8DcoGrMrcIRmfy4NdXUNRY3N5VG3M+Nu3GbdOSMv22Eq746pSHqp88MTdh6
 ghyjNETei9atG11EARGk0HdGxL0arYlN7Cv2G7DRh1LcIXEUbTUHMmdBZnIlLw8ow1ir
 Ig7A==
X-Gm-Message-State: AOAM530cNhuBDtMz7q4ud88qOwDDHrYFVQ/F9X1JCJVNzDZupRGiJD6l
 eieSzyHt85HAsLyYXU3y+RqV8g==
X-Google-Smtp-Source: ABdhPJwex7baaKudfm65MvuCl2P3LSdNpzZo61HBqCeIhBlgRCLZztOtNbFG1z9l9/77e6YH46M0sA==
X-Received: by 2002:a17:902:b78a:: with SMTP id
 e10mr6371924pls.201.1591301719607; 
 Thu, 04 Jun 2020 13:15:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l23sm4643875pgc.55.2020.06.04.13.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 13:15:18 -0700 (PDT)
Subject: Re: [PATCH v8 30/62] target/riscv: Update fp_status when float
 rounding mode changes
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-31-zhiwei_liu@c-sky.com>
 <7cb2aa5d-833a-8544-dadc-5aabba06ecd2@linaro.org>
 <ca1e71cd-c290-5fb9-e9bf-026c73e06560@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ec3d397-bf9a-07f5-3014-4acf47a4fd6e@linaro.org>
Date: Thu, 4 Jun 2020 13:15:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ca1e71cd-c290-5fb9-e9bf-026c73e06560@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 04 Jun 2020 20:15:23 -0000

On 6/2/20 10:46 PM, LIU Zhiwei wrote:
> I think you are right.  Maybe I should transmit frm to ctx->frm, and check
> ctx->frm in vector fp ops.
> 
> We can set ctx->frm = env->frm instead of ctx->frm = -1 in
> riscv_tr_init_disas_context.
> And  remove the sentence ctx->frm = rm; from gen_set_rm.
> 
> Is it right?

If we record frm in tb_flags, then we also have to reset
env->fp_status.rounding_mode for scalar fp insns which encode a rm != 7.
Depending on the exact mix of fp insns, that could result in more changes to
rounding_mode than we do presently.  This is something that you'd want to look
at closely to make sure you're not making scalar code worse.

I think the easiest solution in the short term is to have the translation of
any fp vector insn call gen_set_rm(ctx, 7), so that we are certain to install
frm as rounding_mode.  This will happen at most once per translation block,
assuming no scalar insns that would also require changes to rounding_mode.

You can work with the risc-v folk to examine frm handling more generally
separate from this vector work.


r~

