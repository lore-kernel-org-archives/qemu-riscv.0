Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVzRZ-0006nK-Jc
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 13:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVzRY-0006lI-5y
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 13:38:48 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVzRV-0001rG-La
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 13:38:46 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so2383384pja.5
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RuFK10TSCPDhZ5zBq/WmlGFcwRrVgs2wOo2eDDnr2Bs=;
 b=mzId2zgTauI/9PoxrdAKlNXH9F+3gCng7qE6pVQZ8rF7L7iSKMWBdMQzzmIRtJvSwn
 ia8tSvqqzFz7hab65FDgXPB/rGNUkcm/I1dIVXB5Vw1o3uIUyTg2aFunrrTLsBKiUSSm
 1wdSI+xMWAaFMXc5vaZtypkDO39C0M74Mg2/WJ5yM3wCIli6qnewazOANQqfTZNVl6gR
 zSJXw2jcou2LLq32WRKKxBhuA/hy/c29vwT+v4ausvHrOaPRxkTgtQ17lnc9ji/pm34c
 cjBilkyB4u3oYZj0436Xd7tdmbxc3florVEjPo11yyBltZtXaoKnwOBDSEases5VaAi3
 iZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RuFK10TSCPDhZ5zBq/WmlGFcwRrVgs2wOo2eDDnr2Bs=;
 b=x+EKobn3YAKw5biQNlcFOvAuh9kkaemRhnTjs9CtSnJwKkPPye4eHF0En0JxNnpRPc
 Exdb511kYZDOncAO6KE8YDlWt3q7xCkKxdBMwhrrdB/Z9CUScb58xGhxDhLpHmaMxm0p
 ttU1iwTI3+IvRNFLPXJbkrmBwfYlo/shFz/pF03mEe0hvGWrA+JAA/RzU2jDMBZms0p2
 oeKIFf6AmVc32OhHNbZMAyc9W+ChEG47om0Uw5hpnNd/TCwoKSxrzXdNNt1ypRK7fKWU
 k8bZ2/zKwy51O8cNtd+/tJt3Am9WJAj/7vRYyyv7YW2K0qiEgNa1ZcP6YqjOOuPMPxgD
 ZUiw==
X-Gm-Message-State: AO0yUKVpoE6qKwuVSJGCr2aFKcmT5GMSVsUlLBS9qfbNbDpbM3dYb5iK
 KK3OUykLeyeI85+6+8u2LVSfzQ==
X-Google-Smtp-Source: AK7set8wQcIJ8UuO+AqvO7ae+BIRRdn3FkZgmbn1ORaB79pMOAsJWL5bHTMLMCxaBqsQ8OD7L3d8RA==
X-Received: by 2002:a17:902:f687:b0:19a:a43c:41aa with SMTP id
 l7-20020a170902f68700b0019aa43c41aamr20247109plg.66.1677350323998; 
 Sat, 25 Feb 2023 10:38:43 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c08400b001978e84753asm1576942pld.65.2023.02.25.10.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 10:38:43 -0800 (PST)
Message-ID: <06a53b69-b58c-168f-7e7d-bf7d028ebccd@linaro.org>
Date: Sat, 25 Feb 2023 08:38:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 74/76] tracing: remove transform.py
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-75-richard.henderson@linaro.org>
 <c12cd821-59e5-36c3-0231-f81e3a4e1433@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c12cd821-59e5-36c3-0231-f81e3a4e1433@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Sat, 25 Feb 2023 18:38:48 -0000

On 2/25/23 00:22, Daniel Henrique Barboza wrote:
> Richard,
> 
> Not sure if I forgot or missed something but this patch breaks my build as follows:
> 
> $  make -j
>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
> [1/885] Generating trace/trace-hw_hyperv.c with a custom command
> FAILED: trace/trace-hw_hyperv.c
> /usr/bin/python3 ../scripts/tracetool.py --backend=log --group=hw_hyperv --format=c 
> /home/danielhb/work/qemu/hw/hyperv/trace-events trace/trace-hw_hyperv.c
> Traceback (most recent call last):
>    File "/home/danielhb/work/qemu/build/../scripts/tracetool.py", line 19, in <module>
>      from tracetool import error_write, out, out_open
>    File "/home/danielhb/work/qemu/scripts/tracetool/__init__.py", line 21, in <module>
>      import tracetool.transform
> ModuleNotFoundError: No module named 'tracetool.transform'


I saw the same thing on gitlab, but not on my laptop.  Weird.

> It seems that tracetool.py is still referring transform. This fixes the build
> for me:
> 
> $ git diff
> diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
> index 5393c7fc5c..c361815bc1 100644
> --- a/scripts/tracetool/__init__.py
> +++ b/scripts/tracetool/__init__.py
> @@ -18,7 +18,6 @@
> 
>   import tracetool.format
>   import tracetool.backend
> -import tracetool.transform

I also removed some code below that used these symbols; they themselves appear to be unused.


r~

