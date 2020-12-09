Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kn1q6-0003aI-TX
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 10:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1pz-0003Xq-DX
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 10:57:09 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn1pv-0002GC-9w
 for qemu-riscv@nongnu.org; Wed, 09 Dec 2020 10:57:06 -0500
Received: by mail-ot1-x344.google.com with SMTP id h18so1791626otq.12
 for <qemu-riscv@nongnu.org>; Wed, 09 Dec 2020 07:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CgeJ+FhlwnVmPVJ5PD7WstdqIFbg9IBk7OCa4ebUROc=;
 b=p8Wq4ry5xZvutL1tzhXrL7AQ+6uUzzfauECaghoDayJOjqbHT2nyjxknfA+alZg1G/
 ZbDgNzA7DWY7fz+0AJNFm8b0FIllZMdsRYbsE9qQwCJRCcvVXFI2ituO/revaoOIBSlW
 sdZb23V0FXBrCM6YEoHnqacptNm/K7heo8npiN95bG2MWNf5dfMb5RUgePDzE/7BfSKg
 2smuuOSwZ1J/ponXvx6Kcrk1jAvEmT1pImY5RwZIxFUje9sKEiYxe0NEWFQyVak7G4o6
 vlD7RWTws5splCyFBs6rukcqc5dy1NpO6q/1v6i8chocootK8GgeX3zWgPR9uksyIccj
 wl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CgeJ+FhlwnVmPVJ5PD7WstdqIFbg9IBk7OCa4ebUROc=;
 b=YmYD0tB7ScwpjzFQME3OBYUSRRl6UyFQTlwOauMdBl1GvY7BUqoPfhqd5FcAj891pg
 f8GMso+JSaS3UUdoILlteSpOw1Hxjby/oJbgm8pF/I3ANnqT2EdzPUBZKwpa3SNPMbMm
 2QMl+T+7ZZ0b6w4XpPUuVTWpImZegz88sdbd+1UpGJB5pFn5GsjTbEoqS17MKBMujyUd
 QWeeMG7++03t6dSj9aMjcxobZUCPLVaidencLpQ/VH/RaPORSJOybM/mnWRpS5htgTQm
 kQy5M2yuGl/9s42PpYzuQq5REElgdCdAk/cSII01qD4t3KFNGfP3ttKIvkU30WhVWqOs
 qpZQ==
X-Gm-Message-State: AOAM530PsIh6bJRKX4aOnbJLZv+KAOtFjyJv6C1gNHlyk/U7PFzx+eB2
 5lQZ5U5pGhGJrnA63A12WIkeAg==
X-Google-Smtp-Source: ABdhPJwbELtCqU3J/cXDXU6P+MXV5kdlEy+6vS4HGe4Gjp23mrBwkfRFw94QBpQWmrLBPY7iGTSlXg==
X-Received: by 2002:a05:6830:1c34:: with SMTP id
 f20mr356469ote.147.1607529421958; 
 Wed, 09 Dec 2020 07:57:01 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g88sm453263otg.64.2020.12.09.07.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 07:57:01 -0800 (PST)
Subject: Re: [PATCH v2 09/15] target/riscv: fpu_helper: Match function defs in
 HELPER macros
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1607467819.git.alistair.francis@wdc.com>
 <1b78dbf9afd11bc9e47ce112a0096521a744133c.1607467819.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65e90c9b-ca1b-a1c4-78ea-63500ce59ece@linaro.org>
Date: Wed, 9 Dec 2020 09:56:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1b78dbf9afd11bc9e47ce112a0096521a744133c.1607467819.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 09 Dec 2020 15:57:10 -0000

On 12/8/20 4:56 PM, Alistair Francis wrote:
> The helper functions defined in helper.h specify that the argument is of
> type target_long. Let's change the implementation to match the header
> definition.

Given that these are riscv64 specific, you could alternately change the header
definition.  Dunno if that's clearer or not, considering an implementation like
float32_to_int64 -- is it immediately obvious whether or not we are truncating
the result?


r~

