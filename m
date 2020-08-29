Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC6es-0007o4-34
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 15:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC6eq-0007nB-O0
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 15:37:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:35071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC6ep-0002oQ-3s
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 15:37:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id a8so1200541plm.2
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 12:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1DZS1CKCCVu4mf26sz0wE+xra3IkdIj2/iwU10xcWog=;
 b=Y3vkyIjBLqHdF6LrYpzh27pKf5VcikSjXLOH3jvRBweb640yYTPjMlO3ZlWPnOHc/i
 awx1zQ+hxh+pD5S1Ovy6PXeN/iDh6kBgvv8acnNklo+mZ/WZyAWSMwdBROiJ3plLstmI
 rhMQZpGfBdSgmt2b/oL8lfUJNGc62CZbG3fdfzrYFNalC1t9DhI4mVz6si8A/qMiQH2h
 WjZZZtl/G2qGJCaMkCenF97QvXQYjmSVa8OSJEJ9X4b8r7kwS97u3LclqlKrIjcx+/xx
 c+0212QYIXZ0Oj9J5WCS8bO6+/9x2UDYk/7rEVmPFaQOevnyjZAIT+xjNqjs/dMU9LL+
 b9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1DZS1CKCCVu4mf26sz0wE+xra3IkdIj2/iwU10xcWog=;
 b=fw9o9Fh3ggogZHwD7YGDYcE9PaJqu0TH8uHjaAg+zLeSP6FuOq0Wqi6rhxhtYiyCgN
 USH6T7bzIZQwza1Jgv+oAS0zGqqNj2AZe080tuzRnST6bHr1ztQrtJjV2Qpf1b7qaL4k
 +ywmKiJkWNrhAnEru4smINdPxkOH6CnVUwkINHT0lPqjRQ1bXtzCPxb9ARbNyhuyFt7j
 PTxYQG9ATPPCg5+hPh4D7b0Fl2KaQ57nzeMQ0gbvJCzS+5qdO7wyS4NvyG50Pq3hzm02
 /w2rzA0fsWJiQ/YWoAu9c5CU4B2yIsT9rcEMRH7/4o+j6je2IG36QygW3QNHa5BfDjGK
 Jk2w==
X-Gm-Message-State: AOAM531vdEGm2Umnei9tgqS2dFLicu39XtBTUdKilWFj97QjuamoYAFw
 LL1YBpMdjRdAr/1Rk4vRG2uQwA==
X-Google-Smtp-Source: ABdhPJwCRfBYjVooiyOxKEZ3iiWB+DHMEK13tPQtklgBpEntSMHAaQR+d1wG6I8XjNyaLvw7iOJIXQ==
X-Received: by 2002:a17:902:ea8c:: with SMTP id
 x12mr3601018plb.60.1598729817556; 
 Sat, 29 Aug 2020 12:36:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b6sm2699920pjz.33.2020.08.29.12.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 12:36:56 -0700 (PDT)
Subject: Re: [RFC v4 25/70] target/riscv: rvv-1.0: take fractional LMUL into
 vector max elements calculation
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-26-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a6b10a16-a0e9-6229-7461-65ba6fda7e9e@linaro.org>
Date: Sat, 29 Aug 2020 12:36:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-26-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 29 Aug 2020 19:37:00 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Update vext_get_vlmax() and MAXSZ() to take fractional LMUL into
> calculation for RVV 1.0.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.h                      | 43 ++++++++++++++++++-------
>  target/riscv/insn_trans/trans_rvv.inc.c | 12 ++++++-
>  2 files changed, 42 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

