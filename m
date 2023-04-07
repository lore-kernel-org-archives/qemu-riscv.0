Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkjnY-0002dD-83
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 06:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkjnW-0002cp-Jw
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 06:58:26 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pkjnU-0001NU-OT
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 06:58:26 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 6-20020a9d0106000000b006a177038dfeso12787152otu.7
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680865103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VM6FM2LJRJxH65LWMfFSUM8govz4lfog5Hq1kdZZyzk=;
 b=phKrHTA3Kh3wUCfmntHEfHqbdirrZ8jSXSL6YxnS0Uzx4prU+Wv0xYgVxSb7aSbxvM
 GE+HgziLue7LR0OYYop13II4T2nRSagPYrgJFB0XDahR6JP4qFFiXBpDJkPHBYNDXdx/
 tgVAtzrMILhP89iXJoASCMwQFx8Uk2PjcLRwq76JUQuUJnZfAj1xZoTv1MJGcs/DQ5Nd
 kS7Sizh+LFcqvxNZKlsNajB/urc14HsAFsmYqTmHVUrq6p68XLR//OFyx+EzEXUmcYME
 2K2TvauYHKvNZN7QM4PNFomtusve/VANW4OB1RmDyzGCy5EBxZcym+s1vJHXvUZYf2Eb
 e1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680865103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VM6FM2LJRJxH65LWMfFSUM8govz4lfog5Hq1kdZZyzk=;
 b=N0NdrokhKRUXqqOzzJQ5EuOD12mcG1jWb+DqwnwSqLRQHzsOvLpY8V10uaH+ts0xQ+
 iMgqCgaMq+n+EWtEqKeTI76db/J3MXkKAdEbE3+y/xIGiq3tOE4zaeOSxn4DHD0yw2L5
 y0CH/RlapR3GAAB3IbRlokBgVoGvJ6F4QqGFgmLS+9l602J3raoVfZsvDLRW8XjK0Edv
 Kpp0pR42NLRqdy8SQdDD7UDh/6PohOK25DB5RbXGRfw8doa6wHtPhD+pSTjgsGMmm36p
 kAMHXhkMQTldTxFwx2XWs+y2hJgfyxE0kLQH/DWnDu1z7/QvuN4o3A/0AOGS/I/7659B
 h37Q==
X-Gm-Message-State: AAQBX9eFDZufueel+px2W1vNCq7vqWXfgFVD2WCGHU5vLNSqrkPDIVUi
 px4Z5xEqrSomaooGQMw3q/rAgg==
X-Google-Smtp-Source: AKy350YVBmsWgbOK0FsVha0lhicJHNGa+1F9+X6egmPZLHVnRZ2ORdWopFXAKnqpMhItoEK0NSBXfg==
X-Received: by 2002:a9d:3d5:0:b0:69d:1f1d:4629 with SMTP id
 f79-20020a9d03d5000000b0069d1f1d4629mr4559410otf.6.1680865103264; 
 Fri, 07 Apr 2023 03:58:23 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a0568301e5a00b0069fa776d3c2sm1608326otj.18.2023.04.07.03.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 03:58:22 -0700 (PDT)
Message-ID: <c65a5831-ce79-f198-f491-37707abf9f81@ventanamicro.com>
Date: Fri, 7 Apr 2023 07:58:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] target/riscv: Mask the implicitly enabled extensions in
 isa_string based on priv version
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230407033014.40901-1-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230407033014.40901-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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
X-List-Received-Date: Fri, 07 Apr 2023 10:58:26 -0000



On 4/7/23 00:30, Weiwei Li wrote:
> Using implicitly enabled extensions such as Zca/Zcf/Zcd instead of their
> super extensions can simplify the extension related check. However, they
> may have higher priv version than their super extensions. So we should mask
> them in the isa_string based on priv version to make them invisible to user
> if the specified priv version is lower than their minimal priv version.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cb68916fce..1a5099382c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1709,6 +1709,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>   
>       for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>           if (isa_edata_arr[i].multi_letter &&
> +            (cpu->env.priv_ver >= isa_edata_arr[i].min_version) &&

We don't have a way of telling whether an extension was enabled by us or by the user.
This will end up filtering user extensions from the isa_string.

IMHO, the way the logic is working today, we can't enable Z extensions based on enabled
MISA bits alone and disable extensions based on priv_spec at the same time. We would
need to check for priv_version when enabling these extensions implicitly during realize().
Another alternative is to not disable any extensions at all based on priv spec - we send
a warning about the priv mismatch and that's it.


Thanks,

Daniel



>               isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
>               new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>               g_free(old);

