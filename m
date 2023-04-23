Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqUBX-0004NW-1o
	for mharc-qemu-riscv@gnu.org; Sun, 23 Apr 2023 03:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqUBW-0004NA-0D
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 03:30:58 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqUBU-0001r5-FB
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 03:30:57 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso1914779f8f.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 00:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682235055; x=1684827055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N24O491mJEhNcIKEytZSGussY2E41uyw6/N9ehBdK4Q=;
 b=l2DfMTJpr+oNZoik/8D6RORvbvrQw4ZFJvFpzuhX4SXM8huNXM5KcKiTOymGVFCIPi
 rg01xNMz4yfc0rRXE6Jhsa2epLnZhTZZQeVr/VijVZG7ZHX8O5Qh2DTC/C/i6zqCMU+5
 U22cGEi7087UhMvJJ+1biPser2E+OVJ9oKW9q365z/alzM2RENZLYzNGd3udqJfYGkbX
 ueaTi3ciQJzX2EitrIiWEFOS3Zvm2qq9b8x13i39eaNIgTFClcXiq4vnqQHTuwLxe8vg
 VF1djDqZ6Y1o1MtFjW6/vCDLfV3cFdF8766ldrdCdP1mtfNRJLWrO7EMO+QcEw0rryzS
 0bFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682235055; x=1684827055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N24O491mJEhNcIKEytZSGussY2E41uyw6/N9ehBdK4Q=;
 b=EflTnBaIEHsCwOTkwwmZqzBTWREVrY9elcgeSxWjBdOEULNRCCwPUSc7m5iSagZJ8j
 72oc9W/+P3cngAN2/XYLfrucycG7cZf05fJbpYrAsD3X+cesTXqqHeGOHg1+vlXidmcX
 Y182cnOdtfUyLR9kqoiIbqLKidUnm8oyW+p2eGphhhA6a0pYLLQdLiXo1lcOGmvUH6+U
 WUGm4h+t0AduLSIvXMN9VSmF3kdpJMZT7YLYgb/wfztNuzYlYs0qVFBJOvOV4DpDEwPP
 Fsgn2Vz+6Ezdg9WIssuYkF0/cXjQzSo8emBbe66EudXe1BxOT/yV4OQUboNu0TQe46Xb
 ZRzg==
X-Gm-Message-State: AAQBX9fMOkuHeAFc0PKzXlFVP5cq8Vcegb6mtE4zrKvpgV7sqZroViP7
 BDFb3i7G+Coc6kTEAVP55Vchbw==
X-Google-Smtp-Source: AKy350Z6oBqvUqrf5glxd9wdB8xsV8KfNrqCkGkwyN4G9kYsw/ghde+lOKWoPrOg7UEQyMPkOYOuWA==
X-Received: by 2002:adf:f209:0:b0:2f5:ace2:8737 with SMTP id
 p9-20020adff209000000b002f5ace28737mr7817660wro.32.1682235054927; 
 Sun, 23 Apr 2023 00:30:54 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 z2-20020a5d4c82000000b003021288a56dsm7198959wrs.115.2023.04.23.00.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 00:30:54 -0700 (PDT)
Message-ID: <db8c5197-74b4-497a-587f-994b100d4344@linaro.org>
Date: Sun, 23 Apr 2023 08:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 31/54] tcg: Move TCGLabelQemuLdst to tcg.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-32-richard.henderson@linaro.org>
 <87d1ac98-17b9-7321-05d9-fbcb158f978b@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87d1ac98-17b9-7321-05d9-fbcb158f978b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
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
X-List-Received-Date: Sun, 23 Apr 2023 07:30:58 -0000

On 4/21/23 23:29, Philippe Mathieu-Daudé wrote:
> On 11/4/23 03:04, Richard Henderson wrote:
>> This will shortly be used by sparc64 without also using
>> TCG_TARGET_NEED_LDST_LABELS.
> 
> Is that in this series?

No.  I've been cherry-picking patches here.


r~

