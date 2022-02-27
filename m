Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOPLd-0004E0-IB
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 14:36:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOPLa-0004CL-RM
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:36:46 -0500
Received: from [2607:f8b0:4864:20::52f] (port=41488
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOPLY-0001T3-RS
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:36:45 -0500
Received: by mail-pg1-x52f.google.com with SMTP id o26so8984744pgb.8
 for <qemu-riscv@nongnu.org>; Sun, 27 Feb 2022 11:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z7LJhSOeMLz7nIatZ8CkZU13SeXtQdLbV02wDuKZrFs=;
 b=GgxABUCiOQslAm6chHoVPSmPp9M4SEUo8jfjPLDgVeOuufb52dXPjy+iyJ0O5x1h5K
 CLUJL+aco2QggshRp/DMO8gP+WUte7uWepMPYurieEtOVEyQD31YUGotj1Xa716j54ao
 X8R5Kv606ZRCpVIPi0RmKexmnA2/YX2AuMhT8yaq/DNQYyHL7Z4VzyNqHTT7EW4TI/li
 KLle3yndWv3U9fRUaGbdA28MrcgCO0+okhoAk5CQp4Xz2MMGjdTLl01WN8AVX8j/94IN
 R5c8eg/d5ewin2bvr/OEcF/hyyCmHo8RAHhMwJ6mylNrcjhWmT/1Ir7X8Zzyvytx2oAl
 ObBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z7LJhSOeMLz7nIatZ8CkZU13SeXtQdLbV02wDuKZrFs=;
 b=XfmSyJkLKIisT+AeXf4USlvikx4smW/DTFcT9bhueIdO8WNE7yIhq07LvZi8/C6JfX
 EZOs72wopkPppeJ2PdBLKyExDhZZ8Tmb7Z9JuTBLHq1e0eMsYt+xOL7/BGUQoxBzzdDP
 /YiWb5NtgqBBNSH3jKwZ77sG8L7ovxXLKyH1EZuKW0SHhXf7Xbe6dmIjjcxdpuumwaws
 JCAXl7Yt3D0I6+3o44c+6nPF1KrBGvMeC/1TPod1tC7jx5NenaYCrv74Wy0jIZmFAiEn
 e0PUUN5eXDcJOxsfe1ibxYGIi1gOJMzSXvbN8z1XxQoaDPt5OpVu0R0atcUJGmL8pW9k
 IHPg==
X-Gm-Message-State: AOAM532JLtcrWk8S3BlaZXIGv5cLGH1IAStnH2+LKi8TiVBCzHB5knIh
 o3aVQsi6Z/vbVXqVqKB+b0p4ig==
X-Google-Smtp-Source: ABdhPJzqtGhc7YM8QEN6uJgKaxuLykqie/qozLb1XkWpsTLrJ2wP7nz7Pp4joKpJHlXKe815U2jmdw==
X-Received: by 2002:a05:6a00:8d1:b0:4c9:f1a0:e0d0 with SMTP id
 s17-20020a056a0008d100b004c9f1a0e0d0mr17830758pfu.53.1645990603601; 
 Sun, 27 Feb 2022 11:36:43 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 t29-20020a63225d000000b0035e366803dasm8071904pgm.45.2022.02.27.11.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 11:36:43 -0800 (PST)
Message-ID: <85e0e15e-e14d-4623-6d22-85053127f592@linaro.org>
Date: Sun, 27 Feb 2022 09:36:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 10/14] target/riscv: rvk: add support for sha512
 related instructions for RV64 in zknh extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-11-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-11-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sun, 27 Feb 2022 19:36:47 -0000

On 2/27/22 04:25, Weiwei Li wrote:
>   - add sha512sum0, sha512sig0, sha512sum1 and sha512sig1 instructions
> 
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/crypto_helper.c            | 31 ++++++++++++++
>   target/riscv/helper.h                   |  5 +++
>   target/riscv/insn32.decode              |  5 +++
>   target/riscv/insn_trans/trans_rvk.c.inc | 56 +++++++++++++++++++++++++
>   4 files changed, 97 insertions(+)
> 
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> index 6cd2a92b86..fd50a034a3 100644
> --- a/target/riscv/crypto_helper.c
> +++ b/target/riscv/crypto_helper.c
> @@ -360,4 +360,35 @@ target_ulong HELPER(sha512sig1h)(target_ulong rs1, target_ulong rs2)
>       return sext_xlen(result);
>   }
>   #undef zext32
> +
> +#define ROR64(a, amt) ((a << (-amt & 63)) | (a >> (amt & 63)))

Same comments for patch 8.


r~

