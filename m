Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDNG7-0001bO-0H
	for mharc-qemu-riscv@gnu.org; Sun, 15 Mar 2020 03:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDNG4-0001Ys-Mh
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 03:00:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDNG3-0008El-9v
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 03:00:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36304)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDNG3-00085w-1Q
 for qemu-riscv@nongnu.org; Sun, 15 Mar 2020 03:00:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id nu11so3391391pjb.1
 for <qemu-riscv@nongnu.org>; Sun, 15 Mar 2020 00:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1nJn24+xsUDqNvK7aXvJw5zcGpxmeT7eNgNxiW7ww4E=;
 b=xmXZmc4tUTOFWuvm3iwsXzQIS7RN55vq8umZcS0ACazunPX/aZWLwbINIMyYWQg7Co
 ylQQCk6ju+EfQEBuj8QBxKHH9nSTyPOJIofJF+CEFR9/Nk6PicBPucagFdUzy8RApCTQ
 hW8K3OD7esRWMRES0TUFz/lU4epj7ai7XphVQxN0hvYePRVZMOJfuIKopjFKDaVXRRJE
 0K/Plgwp66YYaK+WhN1nqza2+enu/CMtxqyy4zf3hG3QsTQqZxvf4gG/m6y8Nx/AlUfM
 3m9znaJRFjykGWyF1RMxUfc3t2Q5+mR/ickVAuGlyiePuX68uLsbyKf7JSokvekhetUj
 KuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1nJn24+xsUDqNvK7aXvJw5zcGpxmeT7eNgNxiW7ww4E=;
 b=cxGPwdzNFnXTtuFdjpktbSELVCr2iBWNKmSvgYN4kq0MAqY5fq9SFZhlSDNQrkX8BV
 Z/p//78IOCr8QArO0mhrSRIt3AVCvNClIyE8m8x7ltlJAMkFS2Q5fD9ErqPQ1vNF2aNT
 DAmKEn61N7eObB8LsRuzLnMvoP+oROMiNXeQqyw4V6Qd6keToXXkvtm82SCkil/PX1NO
 8PUaK5T62PN1BLA+DK96Hi3oS9BS4xnG6JY+ZqpMnnEp0zMiRNQH0kd3eV2960CBg/fM
 k04waNejzwWJz33NqigM1GOYook70QVk3H0C/cFcHykccHy22uE57sH9wmnPi0bVyHUk
 HPpg==
X-Gm-Message-State: ANhLgQ06QynvYa9Zw2t+ZjaNSlY1d2VB6Om+7bYd3OgTf948BTq77iya
 NvfCfHR+JfdbiEGsY8/9kZ6G3gCp/Ck=
X-Google-Smtp-Source: ADFU+vtiGWYQCjD3LsCYqnKBjHO3i1Sq5k8BZoWsGv3xejfjjk23SdkdMzUL1kKh03EWjP45yGkooQ==
X-Received: by 2002:a17:902:61:: with SMTP id 88mr21180824pla.17.1584255621554; 
 Sun, 15 Mar 2020 00:00:21 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 q13sm61036799pgh.30.2020.03.15.00.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 00:00:20 -0700 (PDT)
Subject: Re: [PATCH v5 35/60] target/riscv: vector floating-point square-root
 instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a88db4f-983a-6b79-2c1a-0c55b93aad61@linaro.org>
Date: Sun, 15 Mar 2020 00:00:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1035
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
X-List-Received-Date: Sun, 15 Mar 2020 07:00:26 -0000

[ Patch didn't make it to the list, so reviewing

https://github.com/romanheros/qemu/commit/c77bef489c5517951077679ec9228438d05f1e1a
]

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

