Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jhGUM-00069t-KE
	for mharc-qemu-riscv@gnu.org; Fri, 05 Jun 2020 13:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhGUK-000677-Rb
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2020 13:50:40 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jhGUJ-0006k6-Vd
 for qemu-riscv@nongnu.org; Fri, 05 Jun 2020 13:50:40 -0400
Received: by mail-pg1-x541.google.com with SMTP id d10so5547157pgn.4
 for <qemu-riscv@nongnu.org>; Fri, 05 Jun 2020 10:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8qSmgDz3wcVqNMWxsKKNfMlSiZrh6LfOJQfbQnyXY28=;
 b=hS4oElmdnMViQbOp4/gqKuKAx6DW3fub1uLnRZJFEWiJGewh+mDk4hHF/36ZRb6xy+
 pfKCfxn1FFdLeq1Z2n2vTLvcU/k89mbRsBuIDPIn/E6SKNCyNxftUbWoO9K86bkwR1Qz
 jFBB4E1GLDJImnMA5aZHEovCCXqoMjJ/LeQjPAgc6ES2vB03ARhBwFBt1pU3sLFCQpdx
 V16o++7fKvoqUwWQuSMb+gAyocQiaPbAe2iekHXtS/lzm89vGCh+oqedgUNfzsp/HozQ
 KB0sx00g+Sl9q6FzXxd7FtnVAUeXfTGale4ThLjq76KCQof70HWY3bgOsLJDNxqn4NcQ
 WK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8qSmgDz3wcVqNMWxsKKNfMlSiZrh6LfOJQfbQnyXY28=;
 b=hXiJtk7IJnq6X46OoJ282Ny2VgorNCZWmXcS2mR2sMGfybETqfh2iXdgV/JilGSLMD
 rk4Rni1VQs4jNZcys+xhc7T1UjMOPcCTeM61F8Kc58t/2QF+ykUyOfBVzG5qzfxKDvln
 kJAEFAYTBHfh3sQPLm/ONWMUNWxc30/GWWZo38a+3f5mOXgLIGQnOzwy2YCe6HbXebNG
 SMEeQipE90r1y2n83tpkfneWc5dX4NnH5yRULmy2XWXrCeKn2Ga3CPiZzlrH6UNeDlel
 hcM8uLvxJv9iRO6DOiCuq4XzwOJQm1GCbdz64TOxy/oF9sRZ0SOS3Ag+oiKj6hUFUBP1
 Y4DQ==
X-Gm-Message-State: AOAM533g/QF1qvcmNN8fJr/dgiwTvLXbHlozzKNCdN5CIHj+ErILC/RU
 NfqbmDFJs4Gib3DKpEEYq4EKnw==
X-Google-Smtp-Source: ABdhPJwB3PIH+OT9Uz40cOWWeOW5/3MJqq/7rH6sTaKasWfeyTX16HUn2c6Mu199VDycVk9UexwZvQ==
X-Received: by 2002:a63:7b51:: with SMTP id k17mr10580882pgn.422.1591379438569; 
 Fri, 05 Jun 2020 10:50:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y186sm211551pfy.66.2020.06.05.10.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 10:50:37 -0700 (PDT)
Subject: Re: [PATCH v2 02/17] target/riscv: Report errors validating 2nd-stage
 PTEs
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: anup.pate@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1591319882.git.alistair@alistair23.me>
 <e8f3f03935697c721a5bb3e720d57e78e53ffe19.1591319882.git.alistair@alistair23.me>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <395d2d95-c0cd-d74b-d5d4-34c693b0acb7@linaro.org>
Date: Fri, 5 Jun 2020 10:50:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e8f3f03935697c721a5bb3e720d57e78e53ffe19.1591319882.git.alistair@alistair23.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 05 Jun 2020 17:50:41 -0000

On 6/4/20 6:20 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


