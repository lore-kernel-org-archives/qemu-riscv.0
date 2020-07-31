Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1YRp-0007Og-GV
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 13:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YRn-0007OB-RI
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:03:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YRm-0004e1-Cc
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:03:55 -0400
Received: by mail-pj1-x102d.google.com with SMTP id f9so8151423pju.4
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B3qc1eOTO7U0oDuvpAwLeXRWxxvmVJayOTOKRCpLjgs=;
 b=pZaBw9tm8/RxOYym8ydiTtVza8jAKxFlWNmM48yK094HXglU67F/eB2/kz3EvSwyGX
 dIawA3Fv68Djw5m6qmbBfT0+b+E1m7Q49RcdipDYXi0Sl60JsmJN+xQr88QmtfT3CUu/
 UVI3/yufemluRjMfWD+fiakcR0Z5Hlmx+hOKESL4zx6MIbrla8RQe3IRVBeatnNvsKa+
 Z+vkdFvcs2iH1GD2FSHrGmBi7WM+M0UTc1UKU6iGl2AgKLYq+AnvvtEqMn9JpvDXZw4h
 Mv+4CQdD44o+vi6kTlbW6xKC7lCGdH8/rqrgac+OODjwwcBLomPrzxTsmOpCnfYXoF2B
 iliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B3qc1eOTO7U0oDuvpAwLeXRWxxvmVJayOTOKRCpLjgs=;
 b=QKBtwKowvx7Gfdp51aNBb9kPBR3LpFqGFuJ2wqioapghTA2Th/7sLdMAnBP1Ln3yxQ
 FaiFXlOp4ymHpUQmiQcp63YkRY5x3XQ56hLLnne187EvR2O/trC6H77U3fybXjF7tqU1
 /50vnRQzopzfqoOGxMMWCoOuledqjI3JxalW1ukeu1GHMgUF0wsAN0O+KyBOXh6EUKBu
 zynMzr9gF361qJpcIpYZ/EUIqySSxWRe/JRxeQ+XR+2Ad0dM4vtQptrUkGwMlcXYJqDY
 KN+jhTXdSqbo3cd9+6lJ7Gx+XZUsCjyFTuwKGMdQUV2TBRUu9+1iVWjmsixZfXimxrE6
 MVkQ==
X-Gm-Message-State: AOAM531yKAb0JOj4f5/V0kxPuMsB0AYn0+9Upfu9+y6i4Uw+Ek88qIC9
 Xk1zhF+xeBQqmEys3VP6P2zLVQ==
X-Google-Smtp-Source: ABdhPJyPyLA4PC9uac3lKPqNebskhBQFHgINcT7FrbZ+CvbyiCzcOU/oI7KN0VlPRglipClhibGZ7w==
X-Received: by 2002:a17:902:b60d:: with SMTP id
 b13mr4298460pls.48.1596215032861; 
 Fri, 31 Jul 2020 10:03:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v3sm11310959pfb.207.2020.07.31.10.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 10:03:51 -0700 (PDT)
Subject: Re: [RFC v2 66/76] target/riscv: rvv-0.9: remove vmford.vv and
 vmford.vf
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-67-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3d029a8-abb6-9b20-8fe4-319d66b26100@linaro.org>
Date: Fri, 31 Jul 2020 10:03:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-67-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 31 Jul 2020 17:03:56 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   |  6 ------
>  target/riscv/insn32.decode              |  2 --
>  target/riscv/insn_trans/trans_rvv.inc.c |  2 --
>  target/riscv/vector_helper.c            | 13 -------------
>  4 files changed, 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


