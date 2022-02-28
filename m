Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOlGj-0002gh-I7
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 14:01:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlGh-0002gC-S8
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 14:01:11 -0500
Received: from [2607:f8b0:4864:20::62e] (port=37696
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlGg-0005pD-DC
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 14:01:11 -0500
Received: by mail-pl1-x62e.google.com with SMTP id n15so9310386plf.4
 for <qemu-riscv@nongnu.org>; Mon, 28 Feb 2022 11:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2zzHocgKy1f/ROtjSScnz+V3WB0xI99V5VDrcNXoEDw=;
 b=o0Hjvr9Z2jF4sMIN7NjEP+NAE2KuuaK/GETo6n1mzG1I660XMhiBOWy3uCWdy9+LAd
 zAzJXrcxoV91vkpnexkNuhPdzl8ZMa9Au2RwNuc55nbdpnDXB5xUUkunfYltctVvrPQU
 zIRE0lQo/zwi+i908U90AefqJQdrfXdh3zLeqqpS6PJGppdhpJpISw5lc8Jb/kpLJWSE
 2tuAwxskpghrG0huSX3mTU64fGeYS2M20oH9cdeyJr3JRqdBzB0ybZwfg8F3jLd46T04
 uqkifTySRsliG2qimAVkbnsRo9LsMkWQmbkOkM2f+Rppx+b10glhN1whG+Ul3Sw/ZkBl
 beDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2zzHocgKy1f/ROtjSScnz+V3WB0xI99V5VDrcNXoEDw=;
 b=resW6pj4yDT0qv/G7jUVULlLhdbh1PdVYcGRSzOdbIgDwpn4hQoKvivclKejV///DA
 FKZepOKZrkYzeQC/OzNERXEcpTrGyib5EQ7EXgehDVEDVM/O8H9jGYiRLyXDPiUi82AI
 lNbWZcEAE+FdR6keZx7IwUxeiSM3MamAYWpWXGk7I52Bq8IDUie2k+UTQvuFY8fo/Bor
 iVAOqzbivHiqvAVu5VD17Cyo2wdsVhfQPrqs71EhDRBZU42XqlGn26aR5mUluqut2kdI
 +PnkA+8OHUJiI7Y8Ive/8CN0SJ2p8YLyxNk6m22K9wHFgGLVgRTBGcbiJmagVs5RLz26
 +FCQ==
X-Gm-Message-State: AOAM531AAl+McRXg+8sGO82+5whXUR1tDmjm0pIO4k7YXCSmA1zKSCvu
 VyjZm2hfRo/aE67UwAS6pxvRhA==
X-Google-Smtp-Source: ABdhPJyWc35aqCQw4rJvBMVOUqAr/Kca8wN//WzGae0uROET8uUO0jyLY9nfdFrPmCSYQj3UeimtYw==
X-Received: by 2002:a17:902:da88:b0:150:f47:24ac with SMTP id
 j8-20020a170902da8800b001500f4724acmr21925178plx.73.1646074868655; 
 Mon, 28 Feb 2022 11:01:08 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a056a0015c300b004e17afd9af9sm14976706pfu.92.2022.02.28.11.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 11:01:08 -0800 (PST)
Message-ID: <173dac88-5972-8f96-0363-e2268f0a7815@linaro.org>
Date: Mon, 28 Feb 2022 09:01:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 07/14] target/riscv: rvk: add support for zkne/zknd
 extension in RV64
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 19:01:12 -0000

On 2/28/22 04:48, Weiwei Li wrote:
>   - add aes64dsm, aes64ds, aes64im, aes64es, aes64esm, aes64ks2, aes64ks1i instructions
> 
> Co-authored-by: Ruibo Lu<luruibo2000@163.com>
> Co-authored-by: Zewen Ye<lustrew@foxmail.com>
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/crypto_helper.c            | 169 ++++++++++++++++++++++++
>   target/riscv/helper.h                   |   8 ++
>   target/riscv/insn32.decode              |  12 ++
>   target/riscv/insn_trans/trans_rvk.c.inc |  47 +++++++
>   4 files changed, 236 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

