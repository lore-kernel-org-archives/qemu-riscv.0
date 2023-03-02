Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXmws-0004s7-TH
	for mharc-qemu-riscv@gnu.org; Thu, 02 Mar 2023 12:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXmwh-0004bU-2q
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 12:42:24 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXmwe-0002kK-By
 for qemu-riscv@nongnu.org; Thu, 02 Mar 2023 12:42:22 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 p8-20020a4a3c48000000b0052527a9d5f0so41117oof.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Mar 2023 09:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677778939;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bzFuRdPWTLKwS4+B3ITFQVoZlEBmCzUltGcXTplZo34=;
 b=CWxQWC/lotFscbxfW6m39ADDiGWCrmsJw+SwFubFsYhlrzmgeGl94C/TyVEXSxJpIh
 2EA05v9W1tmXan0gheYEiGFWXjc1HGokzNft06NUxNveH65aV6KztVE/wfm2ZP/HpBID
 XjQyGu2nlNXYx3ecn6USZd3kHCLyN1sSkrvAMJaz5j1QPqyTaAenEtYY8n9q6ycrFH8U
 H4HwX8EP1vOoakFo5hQZ/FuLQlAe9sFlowHAOppcNHQWLeBZO0Iv97c3HmDJUpI61grv
 62w26hLEYVH1U/87NC/7VU0qYzB72BJlueqTdEpRElL0CqOtLK9dNvoFpjkbT74R5TmE
 AFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677778939;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bzFuRdPWTLKwS4+B3ITFQVoZlEBmCzUltGcXTplZo34=;
 b=EJ75Cxs0iNwwSIlSkbZBXXW4usOvrrAHFAYeQQ0htzmwPB4ybr/gEeBFKSc5DzL7ok
 tdesAknY4LRoF1EoMInG7JbAcyImOf9dOgVtFTg9Ja9CMWWKSlxNNXyThlntNqnDyxje
 WocRfnONbDpnk4xy0fvkjXXLv340fi99Zp0ak0MNnzy0rVzlvDO+/PnkLjTc2yoBmM9I
 z0nFxKujfxu9ck80V+w09JB6iQGtYIPcmXvHf/PBXruxSheGz1TUis6CVo3cHISMh/7X
 0A4fkZW6E/jLUkZU24JePCNoX0IwdtZefu60f+zvEzaFSN3eNMAMKlsT7PwI5NNcw5Wx
 8b6A==
X-Gm-Message-State: AO0yUKU5Sn47hKIPLpHl2xs5kMPOgpqRafeQyKDfEFk0iDVlYNxb8KpK
 JrmjiPeBO0Zc+mGji516YNX3lA==
X-Google-Smtp-Source: AK7set/lO2l5bMlXpEPKqMzav+d7TSwTPysHmgA+YtyFI0FQWI7Z6KXUi8Y11z5LGCFtkxE2mCDNUw==
X-Received: by 2002:a05:6820:134d:b0:525:863:ea52 with SMTP id
 b13-20020a056820134d00b005250863ea52mr6741027oow.2.1677778938947; 
 Thu, 02 Mar 2023 09:42:18 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a9d4705000000b00684a10970adsm138619otf.16.2023.03.02.09.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 09:42:18 -0800 (PST)
Message-ID: <7591407b-e8d0-aa05-86a3-8ca7988a6e69@ventanamicro.com>
Date: Thu, 2 Mar 2023 14:42:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 0/5] riscv: Allow user to set the satp mode
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230203055812.257458-1-alexghiti@rivosinc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230203055812.257458-1-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-List-Received-Date: Thu, 02 Mar 2023 17:42:24 -0000

Hi Palmer,

I think this series can be picked. All patches are fully acked. There is a nit
in patch 3 that I believe you can choose to fix in-tree if you want to.


Thanks,


Daniel




On 2/3/23 02:58, Alexandre Ghiti wrote:
> This introduces new properties to allow the user to set the satp mode,
> see patch 3 for full syntax. In addition, it prevents cpus to boot in a
> satp mode they do not support (see patch 4).
> 
> base-commit: commit 75cc28648574 ("configure: remove
> backwards-compatibility code"
> 
> v10:
> - Fix user mode build by surrounding satp handling with #ifndef
>    CONFIG_USER_ONLY, Frank
> - Fix AB/RB from Frank and Alistair
> 
> v9:
> - Move valid_vm[i] up, Andrew
> - Fixed expansion of the bitmap map, Bin
> - Rename set_satp_mode_default into set_satp_mode_default_map, Bin
> - Remove outer parenthesis and alignment, Bin
> - Fix qemu32 build failure, Bin
> - Fixed a few typos, Bin
> - Add RB from Andrew and Bin
> 
> v8:
> - Remove useless !map check, Andrew
> - Add RB from Andrew
> 
> v7:
> - Expand map to contain all valid modes, Andrew
> - Fix commit log for patch 3, Andrew
> - Remove is_32_bit argument from set_satp_mode_default, Andrew
> - Move and fixed comment, Andrew
> - Fix satp_mode_map_max in riscv_cpu_satp_mode_finalize which was set
>    too early, Alex
> - Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
> - Use satp_mode directly instead of a string in
>    set_satp_mode_max_supported, Andrew
> - Swap the patch introducing supported bitmap and the patch that sets
>    sv57 in the dt, Andrew
> - Add various RB from Andrew and Alistair, thanks
> 
> v6:
> - Remove the valid_vm check in validate_vm and add it to the finalize function
>    so that map already contains the constraint, Alex
> - Add forgotten mbare to satp_mode_from_str, Alex
> - Move satp mode properties handling to riscv_cpu_satp_mode_finalize, Andrew
> - Only add satp mode properties corresponding to the cpu, and then remove the
>    check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
>    Andrew/Alistair/Alex
> - Move mmu-type setting to its own patch, Andrew
> - patch 5 is new and is a fix, Alex
> 
> v5:
> - Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
>    suggested by Andrew
> - Split the v4 patch into 2 patches as suggested by Andrew
> - Lot of other minor corrections, from Andrew
> - Set the satp mode N by disabling the satp mode N + 1
> - Add a helper to set satp mode from a string, as suggested by Frank
> 
> v4:
> - Use custom boolean properties instead of OnOffAuto properties, based
>    on ARMVQMap, as suggested by Andrew
> 
> v3:
> - Free sv_name as pointed by Bin
> - Replace satp-mode with boolean properties as suggested by Andrew
> - Removed RB from Atish as the patch considerably changed
> 
> v2:
> - Use error_setg + return as suggested by Alistair
> - Add RB from Atish
> - Fixed checkpatch issues missed in v1
> - Replaced Ludovic email address with the rivos one
> 
> Alexandre Ghiti (5):
>    riscv: Pass Object to register_cpu_props instead of DeviceState
>    riscv: Change type of valid_vm_1_10_[32|64] to bool
>    riscv: Allow user to set the satp mode
>    riscv: Introduce satp mode hw capabilities
>    riscv: Correctly set the device-tree entry 'mmu-type'
> 
>   hw/riscv/virt.c    |  19 ++--
>   target/riscv/cpu.c | 271 +++++++++++++++++++++++++++++++++++++++++++--
>   target/riscv/cpu.h |  25 +++++
>   target/riscv/csr.c |  29 +++--
>   4 files changed, 313 insertions(+), 31 deletions(-)
> 

