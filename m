Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPsUG-00004q-25
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 15:55:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nPsUA-0008UF-4y
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 15:55:44 -0500
Received: from [2607:f8b0:4864:20::62c] (port=38759
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nPsU7-00039E-Rb
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 15:55:41 -0500
Received: by mail-pl1-x62c.google.com with SMTP id t19so2299980plr.5
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 12:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vEq5XEGjeKku93i9ZIVd+lPLyjIL5kXAT/16BO0sKFY=;
 b=Unan2DRSfJOeD3TUq09OmLNr33A89FTTfDK1Xtud6PVsQkquvafjCRigU2AEnl0iA9
 e4TzMoM4/W33I68o/C3rFIm0dN6vjA1MiSC/kj12+yMllZDOilBJKQ4u5Ad1XIItYjmA
 T+WQhqr/xSAEKbGS2KHnyzQvafj8vezFl6fl56fb9qeDvuWJ9JxhKBFw3aDXk3AFWgTP
 N6U09XRwBNFy8FaDjSeIHUU2QOpEyJxZ8HaOvuspMNzspxAUdeC85P7F8jB0L0ilhupx
 8B7nUVpwfcNNn2Ieoa1HjQZpykK5D6umChCQ085TBoqC+zcgkjVsjjH7qIG6pGKQk7IT
 62Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vEq5XEGjeKku93i9ZIVd+lPLyjIL5kXAT/16BO0sKFY=;
 b=2nADeaFWcvQxtXLxkd6nUDd9CGfFTQW7W83G+ui3n4yJ2wJovPAK4tOPE+9AI+0Y4E
 kIgL8gkW0pv3oeuzIj9nU/BPpECMYBfDJYKDPL6+vrIxoINw57P6Io9Rn6vibYX65N2X
 qtPin+0wIWh9Q0gsln2vMrtw/TXB6AS5/Fst1zoRb+T0hZpgXyf1Ip0QlbJBwDohldlK
 7W9/sLTdDOCGKFWxib0bH4bmjVIccMgeNMgIaqIpbCu5AawJC3SmgkXjnXE/WOF7KEE1
 wur1XbRzE/eA8FLp7rARBym386St6b5R5hVyM1oA5oWwe4QEsL1z9bVQYbsZjn+2bfI+
 x5FA==
X-Gm-Message-State: AOAM532v754M61Ap6iRhcA121TuVK8IvFcpQxSQOFBK8JIktYApGJBZi
 3bC0Q13CmSDXmDUmi2Rkx8jFlw==
X-Google-Smtp-Source: ABdhPJwHiSGy6Fr0R/UMIbb69BlQT5kmitYxIdykeu5oOR/IVSbOidQ59jFl3Oa7OMVchzGLXTT/3g==
X-Received: by 2002:a17:90a:d081:b0:1bd:4c83:56ec with SMTP id
 k1-20020a17090ad08100b001bd4c8356ecmr7310319pju.238.1646340936378; 
 Thu, 03 Mar 2022 12:55:36 -0800 (PST)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 k5-20020aa788c5000000b004df7bf0a290sm3477934pff.1.2022.03.03.12.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:55:35 -0800 (PST)
Date: Thu, 03 Mar 2022 12:55:35 -0800 (PST)
X-Google-Original-Date: Thu, 03 Mar 2022 12:54:49 PST (-0800)
Subject: Re: [PATCH] docs/system: riscv: Update description of CPU
In-Reply-To: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, liyu.yukiteru@bytedance.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liyu.yukiteru@bytedance.com
Message-ID: <mhng-10786ebc-b90a-48dc-a4ef-3d732f2cd6d7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 03 Mar 2022 20:55:46 -0000

On Tue, 08 Feb 2022 05:07:23 PST (-0800), liyu.yukiteru@bytedance.com wrote:
> Since the hypervisor extension been non experimental and enabled for
> default CPU, the previous command is no longer available and the
> option `x-h=true` or `h=true` is also no longer required.
>
> Signed-off-by: Yu Li <liyu.yukiteru@bytedance.com>
> ---
>   docs/system/riscv/virt.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index fa016584bf..08ce3c4177 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
>   * 1 generic PCIe host bridge
>   * The fw_cfg device that allows a guest to obtain data from QEMU
>
> -Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
> -can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=true``
> -enables the hypervisor extension for RV64.
> +The hypervisor extension has been enabled for the default CPU, so virtual
> +machines with hypervisor extension can simply be used without explicitly
> +declaring.
>
>   Hardware configuration information
>   ----------------------------------

I saw this landed, but I'm not sure the wording is quite right.  I think 
it's at least missing what is being declared, so something like this

    diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
    index 08ce3c4177..fe40d6565a 100644
    --- a/docs/system/riscv/virt.rst
    +++ b/docs/system/riscv/virt.rst
    @@ -24,8 +24,8 @@ The ``virt`` machine supports the following devices:
     * The fw_cfg device that allows a guest to obtain data from QEMU
    
     The hypervisor extension has been enabled for the default CPU, so virtual
    -machines with hypervisor extension can simply be used without explicitly
    -declaring.
    +machines with the hypervisor extension can simply be used without explicitly
    +declaring it as enabled.
    
     Hardware configuration information
     ----------------------------------

That said, I think we'd be better off just picking a different example 
extension to enable -- IMO this was less about the hypervisor extension 
and more about the syntax for enabling extensions, that's certianly what 
I end up looking at the docs for.  So IMO we'd be better off with 
something like

    diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
    index 08ce3c4177..f59e8777b2 100644
    --- a/docs/system/riscv/virt.rst
    +++ b/docs/system/riscv/virt.rst
    @@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
     * 1 generic PCIe host bridge
     * The fw_cfg device that allows a guest to obtain data from QEMU
    
    -The hypervisor extension has been enabled for the default CPU, so virtual
    -machines with hypervisor extension can simply be used without explicitly
    -declaring.
    +Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
    +can be enabled via command line parameters, e.g.: ``-cpu rv64,c=false``
    +disables the C extension.
    
     Hardware configuration information
     ----------------------------------

