Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX858-0006bu-DH
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 15:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kX857-0006aW-0p
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2020 15:23:01 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kX855-0000Rc-J9
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2020 15:23:00 -0400
Received: by mail-pf1-x443.google.com with SMTP id x13so6735129pfa.9
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2020 12:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uqzoGeUiZyZ6lEYosQvqiZdWcrM0DYFKJVTGGrzKMQI=;
 b=wRb1uXnDB3B43Rad3kX5VqprVPRYTdwN7XTb4VwvQxlmeEOsYeVRCr1QTHwMyk30Td
 ueeSe7nMoprd3KVQtWqobif9tOS4qaK9iXNzlgey7AOduPagwyzALRkBJdwf/2Ui0Hac
 6E5zHNxZJeAeCqU47iIrnYA2AvacFt6YPDI23ea3Sjn2Qx75CpZlpG5Hcu/j4KHjhhOL
 auiDSsYgfruonoIclahZpmzKc+pdIR4RULCHyIpDsg0S3bgDV33U6B6Qyx6P5ZNGbP0j
 D+qWuL9y/gPVxgl+gUHD5aoodY1xWWWPRzJR71wIzIVUlUm8znMcszROoNB2pZ/OSMPM
 CjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uqzoGeUiZyZ6lEYosQvqiZdWcrM0DYFKJVTGGrzKMQI=;
 b=T7kchUZ6m+dCGoQJ9XJ1jISQ1oaaDmsj1D/UtoTrcd8gtYKNamV27auqNS6uCtBXCx
 abMBSjp+YgCjbVuZzgnQ5QLPxeJYptsDXuvxuzch7NbpPW6Qb0qRehWI0xu5YUana1Rb
 7YYpSugAxDcNHz2ZesQZxp03/+HlB62YSsKk1eiUwNOrp7VCJG7KW9LnLqxXiqNz199R
 Wq45zjDNNKehg1zrbionpFezhM/SAtgXZHpgEae5gUwkcpkmhXfC4No8WyIG8quEhlTQ
 v9eqa2ETZsh/ZACSLaHMZiw8VeD3n+tj1jF0pTSk7JL0RnOVy+akopEw5spttpT5W4zu
 guNg==
X-Gm-Message-State: AOAM530yqSFSAXorMjw0RaXfWEYEAML3NTjtAM7hZwQSNgJ/Y9+9+Wj2
 5pOGmPcrc3un2WvDPSBnt2JRAUUH8pV1vw==
X-Google-Smtp-Source: ABdhPJwI9cmnbHNgeNxy5j91vddDTsf2YfcevExrkpztfMl9OMwFgRIhBYstoQHRoAw1nceyX8gC2w==
X-Received: by 2002:a63:1357:: with SMTP id 23mr14808602pgt.13.1603740177435; 
 Mon, 26 Oct 2020 12:22:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i22sm2099722pfq.160.2020.10.26.12.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 12:22:56 -0700 (PDT)
Subject: Re: [PATCH] riscv: Add semihosting support [v8]
To: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
References: <20201023214940.917885-1-keithp@keithp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4faf9e1f-45bd-9f47-8a5f-be7b6fcdf540@linaro.org>
Date: Mon, 26 Oct 2020 12:22:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023214940.917885-1-keithp@keithp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.167,
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
X-List-Received-Date: Mon, 26 Oct 2020 19:23:01 -0000

On 10/23/20 2:49 PM, Keith Packard via wrote:
>  static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>  {
> -    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> +    uint32_t pre    = opcode_at(&ctx->base, ctx->base.pc_next - 4);
> +    uint32_t ebreak = opcode_at(&ctx->base, ctx->base.pc_next);
> +    uint32_t post   = opcode_at(&ctx->base, ctx->base.pc_next + 4);

Alistair asked if this approach is ok.  I think it is.  There are other places
in which we scan forward (usually only forward, not backward, but this is a
special nop, so it doesn't matter).

However:

(1) No need to re-read the current ebreak insn.  That is how we arrived here,
after all.

(2) You need to check for page boundaries before reading pre and post.
Otherwise you could wind up with SIGSEGV (or the equivalent internal qemu
exception) when you shouldn't.


r~

