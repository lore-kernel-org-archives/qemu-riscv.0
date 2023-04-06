Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkVI0-0007CU-K8
	for mharc-qemu-riscv@gnu.org; Thu, 06 Apr 2023 15:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkVHv-0007Bw-Qz
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 15:28:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkVHt-0000b6-Jg
 for qemu-riscv@nongnu.org; Thu, 06 Apr 2023 15:28:51 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c18so38421377ple.11
 for <qemu-riscv@nongnu.org>; Thu, 06 Apr 2023 12:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680809327;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fpLo/YTvHFd+wyIe6CDQnWw4tOiJ1LRxGQgdnJnwC00=;
 b=daBaW6ClXIG64itdu7MjxODdeitQAKfQ6pAtKpbxh0ExpQA07yio9BXEUX4V27Q/t7
 PvJPTXna/C8xNZm+l/jKGyn6Fp0/JJVlYNK1aaTvZcqxWaL8JRfQEWxUB8a0D6qljlOP
 Gyh2pgSMgBpZvklRH8Nvz0D3PxDZte6PXiiQ4nW+gz11dswBZqtbzeUal+MP5nVNedS3
 F+o5hoXvGZ1sY+5GmaJD1RV+P/tj6PFOpxP3PI1SXoHH7xyHSWC59DJrPg8g03+MkWuw
 wA5ha1jd3h7pFpnEby5jeSsYnJ3+M2AGi80DAYhWhggzGoab0szCzB3fB6qwfm9emcXa
 8VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680809327;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fpLo/YTvHFd+wyIe6CDQnWw4tOiJ1LRxGQgdnJnwC00=;
 b=iA8Z413tz744ZLMs1IukH06dk6CJSbtJ3QtS8xSUZDj+Rh05PLvSiiSI87LOLWYrm1
 t+Nf5aF+kD1klCKaKBpUvF72CruM3hWWjn4IBGUstcsetk9V1T+H1YxTMIRktpRo2Ole
 aBlPtDCUUq2HVxqhdXEEd4Qc4Wlqdft9OC1jsjQH5cgIBK2nLbmn96jVByqtm6YA+Mj+
 L7ql/lObRJxOjoIRSgMeGuPX6L4k5g0LzJU6sIm8+oOhRflVp75Yudi1F4MgCxisN/UO
 mv+LurWccMiXygyDZQ4pyTCRmOKWjtq9jH2NHNyO984yA3bKT9Ild8umA2L27vcH3FXI
 N0kA==
X-Gm-Message-State: AAQBX9dwDiDuhKeV+eIxCzNk33NVrV3YevC3f5i1Ky1rnSJg2fenDPGs
 1HpZBQTcTtWHF409D3MzAF0gJA==
X-Google-Smtp-Source: AKy350Z9Uaod461oQdFgk1FVfryONA/HgMonPr90VVHz13m56m3zIQbutl9hoCghS5xhMqHMWuUvEQ==
X-Received: by 2002:a17:90b:1c05:b0:240:d8a:8d24 with SMTP id
 oc5-20020a17090b1c0500b002400d8a8d24mr12697607pjb.4.1680809327448; 
 Thu, 06 Apr 2023 12:28:47 -0700 (PDT)
Received: from [192.168.0.4] (174-21-65-249.tukw.qwest.net. [174.21.65.249])
 by smtp.gmail.com with ESMTPSA id
 nl6-20020a17090b384600b0023faa95f75csm3403803pjb.36.2023.04.06.12.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 12:28:46 -0700 (PDT)
Message-ID: <07e4dd2f-0eac-0415-be4d-bed9cfe2fbe8@linaro.org>
Date: Thu, 6 Apr 2023 12:28:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/2] target/riscv: Legalize MPP value in write_mstatus
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230406072555.21927-1-liweiwei@iscas.ac.cn>
 <20230406072555.21927-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230406072555.21927-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
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
X-List-Received-Date: Thu, 06 Apr 2023 19:28:52 -0000

On 4/6/23 00:25, Weiwei Li wrote:
>   void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>   {
> -    if (newpriv > PRV_M) {
> +    if (newpriv > PRV_M || newpriv == PRV_H) {
>           g_assert_not_reached();
>       }

Nit: if (test) { assert_not_reached } -> assert(!test).

which emits a more helpful error message before abort.


r~

