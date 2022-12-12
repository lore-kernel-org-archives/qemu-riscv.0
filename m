Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4dNE-0007I0-QH
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 02:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dND-0007Em-5H
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 02:37:15 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dNA-0006kZ-Pd
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 02:37:14 -0500
Received: by mail-wm1-x333.google.com with SMTP id m19so4496316wms.5
 for <qemu-riscv@nongnu.org>; Sun, 11 Dec 2022 23:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=34jh5rYxLsLvyduhWYMJVWELK6MkJCh7xd/EeoyA8xg=;
 b=KNxE7vtltlFDj2VLgFTZKUdjCFbDthevvsKblSsBTNNPm4wTelqAIMlFAnx7Jzj0YB
 oeY9uuZ6CJEFuLXtaC1rHvIHnyem6kmXvlfW5uuX3G3KBLQtI853kdoTBXce+sgBd4FL
 BOFdJwWZNzLMhFB5kR32yF/fZgoTnAkhILeDgX4uvUF7ryy1gpG9f0Duf45CUrShBa7V
 vYRb7HqeSXunTZX6g6nYYJnCAqD8aElaL+fnIgGSaGyTXHHEmoj9mn0gmO0cKQArqWck
 HzUMp/Ugoux1KuQZePMXt+yzJOgeTlM3iCEEQFPgJ394l9hPEk0MRdNCpV+bk6V1dRGk
 /LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=34jh5rYxLsLvyduhWYMJVWELK6MkJCh7xd/EeoyA8xg=;
 b=b2fY/g0ENAU211eDZOpd7l54gLjeZKY2O8pySIT+uV3QQ38gFSNqe4s5l07Uuf+yPM
 gNz0LjaPXiALQtRf2oVb4BnHOrGHhWhzuxCOsWefC0X4sGhJGF+2SihC38IH6CrYyPPL
 IjzZ8NfL+OY2DGAMZMa5gZIKTVFNYx4IN8FNxohqYEEOqQHeA1InqDwM0XwR+2BWIEHQ
 ckAa9WOaiyBm0pfe3xXwsSiIKO0YoXooztpEbieK1ywNm2mr9X2EBcBnEC1SZ8SFsV+A
 A/3Zs7I62HsKMkg+9vZaeW1x7xwr3B71WB8T42KkUnSfNqKmZjuZjJH0MUPNJH8/P7uj
 iFWw==
X-Gm-Message-State: ANoB5plQC/n8N48m6x9kSKr3zqK/mBYP1YwxMdEIEBJag39fiRljP40c
 Hyx7ukztDcFqPO0+LkTAarjaWA==
X-Google-Smtp-Source: AA0mqf7vw7/9z4W6+FOFDVi30bMmKeoK4i1YBOrbStr0rfwhAwQkE3m7yaRnSAdDlO071OJ/wtoWtg==
X-Received: by 2002:a05:600c:21c1:b0:3cf:8833:1841 with SMTP id
 x1-20020a05600c21c100b003cf88331841mr11692109wmj.39.1670830630185; 
 Sun, 11 Dec 2022 23:37:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p25-20020a05600c205900b003a6125562e1sm8089286wmg.46.2022.12.11.23.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 23:37:09 -0800 (PST)
Message-ID: <79028a88-8b4d-7842-9ad1-dc3f7918c0c3@linaro.org>
Date: Mon, 12 Dec 2022 08:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] include: Don't include qemu/osdep.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org
References: <20221212070431.306727-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212070431.306727-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 12 Dec 2022 07:37:15 -0000

On 12/12/22 08:04, Markus Armbruster wrote:
> docs/devel/style.rst mandates:
> 
>      The "qemu/osdep.h" header contains preprocessor macros that affect
>      the behavior of core system headers like <stdint.h>.  It must be
>      the first include so that core system headers included by external
>      libraries get the preprocessor macros that QEMU depends on.
> 
>      Do not include "qemu/osdep.h" from header files since the .c file
>      will have already included it.
> 
> A few violations have crept in.  Fix them.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   bsd-user/qemu.h                 | 1 -
>   crypto/block-luks-priv.h        | 1 -
>   include/hw/cxl/cxl_host.h       | 1 -
>   include/hw/input/pl050.h        | 1 -
>   include/hw/tricore/triboard.h   | 1 -
>   include/qemu/userfaultfd.h      | 1 -
>   net/vmnet_int.h                 | 1 -
>   qga/cutils.h                    | 1 -
>   target/hexagon/hex_arch_types.h | 1 -
>   target/hexagon/mmvec/macros.h   | 1 -
>   target/riscv/pmu.h              | 1 -
>   qga/cutils.c                    | 3 ++-
>   12 files changed, 2 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


