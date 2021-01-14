Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l013P-00077c-3I
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 06:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l013M-00077A-KR; Thu, 14 Jan 2021 06:44:36 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l013L-0005aa-5r; Thu, 14 Jan 2021 06:44:36 -0500
Received: by mail-wr1-x436.google.com with SMTP id t30so5465101wrb.0;
 Thu, 14 Jan 2021 03:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n/mT+XUpPloLraTDYpgGDc8uZkFZgKmUglbj/ssR0QY=;
 b=JkLL5hbXBv0hapyKcMHIl1BMDGVlNuWKZxR4UclOm6/nYP4tgjWfpmrDq3jRKi2o9E
 +fJxMOI9A3rWah9uQsNk9P3c5dJbGqnDStmiSjGeCud4TIXqifiLwcRUtLPReF+KxS9C
 EMEV+chKNr5Ti8iNN9AOSy0Cdp6fbD2UMcojYPdJGrS+ZnijRJr5av7Rqc+8QgaoSHIo
 +162H5SWGKgR6lUL8Z/BokKWzfDUelTDhRlDoF9Dp+AerCS3Xlq772q5pAe82khi/3ID
 fryZ/V5bH5KDuaKK07d/8GQoYCssmmVeeI0AiGMcsBvoT9y0S4mFWrmw05hyXZttfUH9
 /veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n/mT+XUpPloLraTDYpgGDc8uZkFZgKmUglbj/ssR0QY=;
 b=OpkwWAzVsfsq1sDB8O+4WP4A5jf2+uFOXDdqAQ20+VLjux7vm+MO3k0gxGyeRsFncJ
 OMZ5S5qaYL73ai8bL1c85CEBxqarH/1eeFZoNMDQL4b1iZj5ctp8Ny7wGnXpJfk9kBKJ
 eOARAkYHnBEn6wF5nB6YeVdfn8YBnR/w+OQe6W7hL4qE0Qtrb9PL8s8J06wFqcxNei+u
 XWU+knF7Y7SB2fGuEMHygs4rt0/ky616qqHahOqnZ21DeCwylyN9ur8t9hLXfjy2L5YM
 OmSnVJzkZy2i+V3aADlbGTW2TDvD2NJoOBzuNR8NSZuZsbhBe1udLcIKPH845AI53nSI
 vJag==
X-Gm-Message-State: AOAM532Mi5EHh3ZzyQo9LIFqAhGSuhwbE2Di28CT2VfVi4liRO6EQTZR
 fLxob76VAL02X/kJu4G2lPg=
X-Google-Smtp-Source: ABdhPJw/PNvGsCUY7IQlnKUyIm91oeNPJ9yo6QxJWmifSKT/mQ3J3LL0R4MOl1rTW9oSXSCzow2unA==
X-Received: by 2002:a5d:5913:: with SMTP id v19mr7491774wrd.207.1610624671380; 
 Thu, 14 Jan 2021 03:44:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s20sm7492746wmj.46.2021.01.14.03.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:44:30 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 13/22] hw/sd: Introduce receive_ready() callback
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-14-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <00289da1-65a9-f717-2f19-8dd8a026831e@amsat.org>
Date: Thu, 14 Jan 2021 12:44:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201231113010.27108-14-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.237,
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
X-List-Received-Date: Thu, 14 Jan 2021 11:44:36 -0000

On 12/31/20 12:30 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present there is a data_ready() callback for the SD data read
> path. Let's add a receive_ready() for the SD data write path.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  include/hw/sd/sd.h |  2 ++
>  hw/sd/core.c       | 13 +++++++++++++
>  hw/sd/sd.c         |  6 ++++++
>  3 files changed, 21 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

