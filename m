Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l3jVQ-0005hf-V6
	for mharc-qemu-riscv@gnu.org; Sun, 24 Jan 2021 12:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jVP-0005ev-84; Sun, 24 Jan 2021 12:48:55 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3jVN-0004Ab-G0; Sun, 24 Jan 2021 12:48:54 -0500
Received: by mail-wm1-x32b.google.com with SMTP id e15so8781449wme.0;
 Sun, 24 Jan 2021 09:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xfiSaS/RDTW9QRbQhqeWLCuYu4nFEmefnM+ge6KuB7c=;
 b=mpgTY8iIcfhC+D3TNw4vzFBOB2AqwUt6iVqZtZVJc+s/IkFaDbh7+7GEKITrEzwMtg
 82hWiM7bd0hZAS11Mo8FUbGwHBQOf3RQN0jj76qrTaZxrzUquSTpI+gj3R0FjU6gaKI8
 /AJbAt4IdBN0qJg7LUDBPP9wBE3BSEOHi4O/V0c7Wh2uVh8E7LG9ppP8S0AmYAt/4yxo
 Tc/wOD9BQ3ibWVRy4rTNNjlPYw1NRajGQ12GKC6jgAE4x0KN25y8waRItOf9aDITFL7U
 431RTsGshVcEKauAclNvVtrL37txEdroskYZX3kFn8/zOqQBOab8Y+fnvB88M6yfdsbi
 5aIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xfiSaS/RDTW9QRbQhqeWLCuYu4nFEmefnM+ge6KuB7c=;
 b=itvlOa5A1vAx3qctgkVcHtj4PojcsFLA/my1A4/ZbH3FEl4KBlI3/ASXes6eDOir7s
 8QBI11c3Fk22UB+K0VoAYjsEClGSTZZfCKcH9eM+HFgDvm9R0xEWza0yklqXBmKx+Icv
 8rSVPCvViPbAD2NSizRrwqx+DRtzLK+WZo3biPxMQlvDocwiwCNqoAUj7OnVQbZeFwLL
 ZmX/E8C0wAA4mEKDkWo4LA4p3IasLargezcgCsHLUVesJr84d/empl16cdXw6FB755Vr
 HXzBgACZCSqMcHnA6/EoPdqarKzUEeLBAfUkRM+qWR//OkmLqGJTWWQ6V0nyI5HsuP7F
 XnxA==
X-Gm-Message-State: AOAM532cxJbMFBVXtB07AqWTcJQi4HZkOqVfvUW7tE0wEO8E3fa9UW9T
 LxbknKqhet832BmUyb+Y4Yw=
X-Google-Smtp-Source: ABdhPJyiOTjHiHg7beE+1iARjg6b0lPcgT6OOsqVf3CBA0DQPUGz7Cf7C8bYREyOZqxyfZu13Sa59w==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr1985113wmj.118.1611510531086; 
 Sun, 24 Jan 2021 09:48:51 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h187sm19103619wmf.30.2021.01.24.09.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 09:48:50 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 03/25] hw/sd: ssi-sd: Fix incorrect card response
 sequence
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>
References: <20210123104016.17485-1-bmeng.cn@gmail.com>
 <20210123104016.17485-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df6ad9a2-197c-c3d6-9db3-405637959039@amsat.org>
Date: Sun, 24 Jan 2021 18:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123104016.17485-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 24 Jan 2021 17:48:55 -0000

On 1/23/21 11:39 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per the "Physical Layer Specification Version 8.00" chapter 7.5.1,
> "Command/Response", there is a minimum 8 clock cycles (Ncr) before
> the card response shows up on the data out line. However current
> implementation jumps directly to the sending response state after
> all 6 bytes command is received, which is a spec violation.
> 
> Add a new state PREP_RESP in the ssi-sd state machine to handle it.
> 
> Fixes: 775616c3ae8c ("Partial SD card SPI mode support")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> 
> ---
> 
> Changes in v2:
> - Add a debug printf in the state handling codes
> 
>  hw/sd/ssi-sd.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
> index 9a75e0095c..043e270066 100644
> --- a/hw/sd/ssi-sd.c
> +++ b/hw/sd/ssi-sd.c
> @@ -36,6 +36,7 @@ do { fprintf(stderr, "ssi_sd: error: " fmt , ## __VA_ARGS__);} while (0)
>  typedef enum {
>      SSI_SD_CMD = 0,
>      SSI_SD_CMDARG,
> +    SSI_SD_PREP_RESP,

Another migration change.

Otherwise (trusting you with the spec):
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      SSI_SD_RESPONSE,
>      SSI_SD_DATA_START,
>      SSI_SD_DATA_READ,
> @@ -163,12 +164,16 @@ static uint32_t ssi_sd_transfer(SSIPeripheral *dev, uint32_t val)
>                  s->response[1] = status;
>                  DPRINTF("Card status 0x%02x\n", status);
>              }
> -            s->mode = SSI_SD_RESPONSE;
> +            s->mode = SSI_SD_PREP_RESP;
>              s->response_pos = 0;
>          } else {
>              s->cmdarg[s->arglen++] = val;
>          }
>          return 0xff;
> +    case SSI_SD_PREP_RESP:
> +        DPRINTF("Prepare card response (Ncr)\n");
> +        s->mode = SSI_SD_RESPONSE;
> +        return 0xff;
>      case SSI_SD_RESPONSE:
>          if (s->stopping) {
>              s->stopping = 0;
> 

