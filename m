Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqexC-0000Fw-IA
	for mharc-qemu-riscv@gnu.org; Sun, 23 Apr 2023 15:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex0-0008VC-B1
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewv-0004Lw-Pu
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:40 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so37805885e9.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 12:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276437; x=1684868437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YhuxIZ5v5vQjaZrSWGTo/f9QQ4mFP5ML307cPL2FIEk=;
 b=Ntx4jM99/Q9ONKMBmHdhFE5ygF+oAKqV3517Oca+osndxlYFDD5O5sTbO86P9BZ+9U
 PwW2fexBGdy8Upataf0wb2FDaQK9L5hhyjU64HDsxKFnqai7+sdsawNZwzfxYpnDrY0C
 CZpW7QfnG2VE0DHR350HmmFSbVRrVXwYq2yDwKT0NOPTCPVJzYHPesLryNwRQ6ML7p4H
 fxBflApFTYaTDLx6bRb/YqhVLt3aiiyu6tg0//eSPs0vyxasbhnN9YHONL9V/za6AYYu
 Jab0d9gG9moheQbZ2+HU96cn0kO/vU4rKiLCwvx0vxWLUMoj9Zq/Wmxm1uyRlTfB3Cf/
 t8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276437; x=1684868437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YhuxIZ5v5vQjaZrSWGTo/f9QQ4mFP5ML307cPL2FIEk=;
 b=FoZj5vjE3yx7l7FEh+5EHnRTORNfytDdggYa1DbD93D0tIEx0ZL50XuHoIX0rLI6Rd
 sJ5HU0DsRnhnRxOZw1wuuNBQBhoFlEHUevimm24Crdrvw8NW5JSglKXVlXb/wMIrl+la
 GGq12PeuEbiLsftXGVipQhn6kuBPgZ+Lfv+uRpVfcaG4f1PbMR9tuA+AYT1KEN806Zkz
 v5zQJt0m3xNvhrsN+l7dE4tJEpEajbT405R8kh/byYk09j318lGkH40JIyiuyyhWfmxW
 nWcQNJ6iXTKkW9GWPHA+p3JER52JY6dYtzwSZmL8XAkhTWUyqsuP48WlpP5540xYziRq
 3ZIA==
X-Gm-Message-State: AAQBX9cnyyqydJu9JOQYxd40SoZ7g0YUaWI8u4MtDqBqzHE5pzsQxFa2
 r+MnJjUmgQbp/S+lcl9THxCnWw==
X-Google-Smtp-Source: AKy350ayMjqV5/OBjzCho3zLEsIYb5RwJu/U/xECxnU6KX1JmwfHNxr6JZG3PHBTcBoj+YuBKfdwlw==
X-Received: by 2002:adf:fe02:0:b0:2f4:de63:a0b4 with SMTP id
 n2-20020adffe02000000b002f4de63a0b4mr7956320wrr.64.1682276436949; 
 Sun, 23 Apr 2023 12:00:36 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 s3-20020a5d6a83000000b002fe13ec49fasm9113641wru.98.2023.04.23.12.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:36 -0700 (PDT)
Message-ID: <0538aac6-8510-6ed5-c5f0-627b90a09bd7@linaro.org>
Date: Sun, 23 Apr 2023 20:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 25/54] tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-List-Received-Date: Sun, 23 Apr 2023 19:00:45 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument register const, because they must be passed to
> add_qemu_ldst_label unmodified.  This requires a bit of local
> variable renaming, because addrlo was being modified.
> 
> Pass data_type instead of is64 -- there are several places where
> we already convert back from bool to type.  Clean things up by
> using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/ppc/tcg-target.c.inc | 164 +++++++++++++++++++++------------------
>   1 file changed, 89 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


