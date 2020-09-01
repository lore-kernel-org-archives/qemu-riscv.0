Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD2t9-0007j8-Hb
	for mharc-qemu-riscv@gnu.org; Tue, 01 Sep 2020 05:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD2t7-0007f6-Ir; Tue, 01 Sep 2020 05:47:37 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kD2t5-0002ig-PP; Tue, 01 Sep 2020 05:47:37 -0400
Received: by mail-wm1-x341.google.com with SMTP id a9so517848wmm.2;
 Tue, 01 Sep 2020 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZePfW9CcemER40jOd+bMBYSyfW5we0kwkJmWKxNpKDs=;
 b=gS/jAMi8Np0QgQQ2XyEELwcQ8cGA5N4xud7r9iYZIn64K6qk/ir+3HZ+jcLo4ra9Y8
 CzeCmWShJItDKjkhY2vxgxoiVtNgn+Nq5AQo7Dy5kA2sKcZ3OeOB2RMYW7TnRY4fvC7/
 2neAwTksFyaBKioyzhFsmycCG1S/oyaa/Zd8RTb+QcfQbT83wuJQL+r5/m4xhQUghNGQ
 C2fDqLSmBIAJL1BQ4FPPcSyBw+0ocNtwOWvToqeMKNuKSVSM7HXQHP/XT1LosyqGdc1a
 3qMBD5FhSJw23hPSTErkgoS0pcyQqMPKix8VUhu+nY1A2zgYRObGyL7nd7VMwwShNotk
 8zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZePfW9CcemER40jOd+bMBYSyfW5we0kwkJmWKxNpKDs=;
 b=f7i0YmonCPdlGzCiYJCQrtQJeqRElDbdSSxq3O5JRIowJ8AMYTdK7UhnAoffJHSx9d
 JtiqHab1JbBu37l8QO5hNMlTWoVsZEjxKCtH+hk1HE7bdf5wa111el9WtiK/LyRcCyjv
 UYldHjQZ6XNHPvPHPYceYK4mPv6EcAe9mhYCxqO1alMtGryMW9+5wnYgsPhlogCGiGcH
 fUgZmm3QjAYrs4un8m2Nsbh8b2skB7vNB/TylbqolPpVYP1KVSEpLCw+bifhiUpdS9R5
 Ovx+4N5eedrdKVHtv02G9KD90kEPuMWLtxZjsONvF2r8N4/eNYl6bzw5XbiaP4IuDEtO
 G5Qg==
X-Gm-Message-State: AOAM531Hm18rcb/JUaoNsTUidmIsiJGbce7LLz6oUP6m/ph/3oceX4PW
 ejwnlCy7YZ2F7DTtHOqjuUA=
X-Google-Smtp-Source: ABdhPJz0RlZtBJUvqcHvcCIqR4leg5nOcmSodqqzFEo5sXX39TSCnQ0+0z7vrZr6StQUr/HVWFVcrA==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr1004374wmb.5.1598953654100;
 Tue, 01 Sep 2020 02:47:34 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id b1sm1344670wru.54.2020.09.01.02.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 02:47:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 14/16] hw/riscv: microchip_pfsoc: Hook GPIO controllers
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
 <1598924352-89526-15-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9d7ae348-bd80-0d74-7eb1-5148d7f5cb78@amsat.org>
Date: Tue, 1 Sep 2020 11:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598924352-89526-15-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-2.13,
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
X-List-Received-Date: Tue, 01 Sep 2020 09:47:37 -0000

On 9/1/20 3:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Microchip PolarFire SoC integrates 3 GPIOs controllers. It seems
> enough to create unimplemented devices to cover their register
> spaces at this point.
> 
> With this commit, QEMU can boot to U-Boot (2nd stage bootloader)
> all the way to the Linux shell login prompt, with a modified HSS
> (1st stage bootloader).
> 
> For detailed instructions on how to create images for the Icicle
> Kit board, please check QEMU RISC-V WiKi page at:
> https://wiki.qemu.org/Documentation/Platforms/RISCV
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v1)
> 
>  include/hw/riscv/microchip_pfsoc.h |  3 +++
>  hw/riscv/microchip_pfsoc.c         | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

