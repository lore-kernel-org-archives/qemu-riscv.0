Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFVFp-0000VT-IZ
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 02:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFVFk-0000UB-Fc
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 02:10:29 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFVFd-0000Pi-O1
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 02:10:24 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w1so14089287wrt.8
 for <qemu-riscv@nongnu.org>; Tue, 10 Jan 2023 23:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JLMrfUKmlGGDmWYHnk7ZCXAGeJsLRVrjdj3i8XFCUkM=;
 b=QsnvU3QjCsGrUrsWmZMal1dSye7ALlPTlWdR8roEyrDSpSTxK4uCYZRp8s0YPW7Pi+
 iNCH8BzYk3d67MKeCG1vRxV7zdeIFTl3dhKrDxswgfX1ppqfAPl/q5ksc0vXLhXpgmZ5
 gyZ14dlu5esz4Yna9dWY4Bupdu0Ra7GI6TtXdqPYjQetM3qHuHJPdCy9pMjWSYJ1aXu3
 RJEHUS+8Y+cJu+27SNrPJ853dDlN/4lYwMCZsHFppzlmfeFZ42cCme2GHrtMhJ1J6ZKL
 GrjNaiXAgexd1SaOpVMGq7zBPoqHafa7W63RaApTWq0/QMvDX4+KE5cgoHgXVFcvY9ko
 arRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JLMrfUKmlGGDmWYHnk7ZCXAGeJsLRVrjdj3i8XFCUkM=;
 b=Qi/iYuIKS8Rqr8CPf2ycDkflxmpX7Y7t9NEc7lBrCzZXOsCAOgoCT9ajlCKGH0ZjgG
 EZHt/8SOjp0FGY3KLBz426YVUbedMBwJ1fYrm5t2Vb5qwNC75DMl/zS+/1pK83HTUnjb
 6AVSXT1DIOyXi5QwN2A57r6/K5DfCVpfCrBc7P7DJWAQoLc4io9QsQrJRu5DjhsaK+S1
 bsS/KAMeggDgFUZFnuPkrfvP66UjehXKtoWF2xHFBIzT5rhXsQUccCRKKzk4AW3n5jVu
 emChTygcYz+c9KTSNo/n5+R1pClbFaCiJFEhCSpWC8sE6OBQ/HuxewK1ws1pYOe6VqcW
 9cWg==
X-Gm-Message-State: AFqh2ko2/xiYx5dUk2IhNGiC+YiHgY7wa4XjeUXEJFepGRihc83A3Xi9
 OXUwtZrE2oCNmpH9FpyeU/Bp3Q==
X-Google-Smtp-Source: AMrXdXsGPsc4OJU/t1NQdJK4GmcIPv1Y7o5mpehNbv/fNNrQ3c/gKOMp6+JozXH+1a+SCVhmx/wolA==
X-Received: by 2002:adf:f107:0:b0:284:5050:5e59 with SMTP id
 r7-20020adff107000000b0028450505e59mr33484997wro.29.1673421016818; 
 Tue, 10 Jan 2023 23:10:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002238ea5750csm15291197wrx.72.2023.01.10.23.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 23:10:16 -0800 (PST)
Message-ID: <92cd2724-6a14-deb1-923c-dad28de5e8c6@linaro.org>
Date: Wed, 11 Jan 2023 08:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, ale@rev.ng,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>
References: <20230110212947.34557-1-philmd@linaro.org>
 <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 11 Jan 2023 07:10:30 -0000

On 10/1/23 23:01, BALATON Zoltan wrote:
> On Tue, 10 Jan 2023, Philippe Mathieu-Daudé wrote:
>> The 'hwaddr' type is defined in "exec/hwaddr.h" as:
>>
>>    hwaddr is the type of a physical address
>>   (its size can be different from 'target_ulong').
>>
>> All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
>>
>> $ fgrep define include/exec/hwaddr.h
>> #define HWADDR_H
>> #define HWADDR_BITS 64
>> #define HWADDR_MAX UINT64_MAX
>> #define TARGET_FMT_plx "%016" PRIx64
>>         ^^^^^^
>> #define HWADDR_PRId PRId64
>> #define HWADDR_PRIi PRIi64
>> #define HWADDR_PRIo PRIo64
>> #define HWADDR_PRIu PRIu64
>> #define HWADDR_PRIx PRIx64
> 
> Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use 
> HWADDR_PRIx instead?

Too lazy to specify the 0-digit alignment format I presume?

