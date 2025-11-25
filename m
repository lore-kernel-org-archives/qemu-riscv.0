Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A56CFD37F
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 10:28:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vNqGv-0002Kg-O1; Tue, 25 Nov 2025 05:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqGj-0002Hn-Jm
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:27:40 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNqGf-0005fk-QJ
 for qemu-riscv@nongnu.org; Tue, 25 Nov 2025 05:27:33 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42b3ad51fecso4255927f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Nov 2025 02:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764066447; x=1764671247; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dsNRN3M7tLf1Kcxi1KCFkpYYf2qs5k6tXujcFgV5vT8=;
 b=VhVpS+Vjeua5YDq5qoiovuetY5pFdQo49cXqpVLWM4d4M9RPFcIv53I3CF0j+nmFmZ
 Bu9wdLKuyMip8ghgU5CYVVItaZbiPJPyFKZS/z/QobZvNomFxm4154S46Z1qXmrSOc0C
 atVVLL/P+VPR3mJSR9bPd+W1/zs20hFWmZfazLV68jO4eftEyHFHjM3CRYVpNv8bH9eU
 6Osi9eECvzhszVtSnN7kRL5iOL5Cir+7dP+4D695C2Xsh+2j/kw+wNmL8LQhCD1LNnLV
 z8diHNt3raH8k+XHaSrdSIOd/gAl7iMaGFhWQXlSh16IthKPU+025pmJ19qEaVjgFdky
 Tx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764066447; x=1764671247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dsNRN3M7tLf1Kcxi1KCFkpYYf2qs5k6tXujcFgV5vT8=;
 b=hOabp9VCOJYRcRX8Zl0JaQPXB2cHFuwLW6kyIYUHKwiA824tYOv+Au+coBvGDZ5q9a
 GdWtV0qLXN61F7pL1wOrg3wXWqavUfe3P3S/vdBBO2DMTpqUelOpjV9OywO+MnM+uw9X
 Q3ImRR00CZCuK/MOF77VMitgLfLAuWP4fDzfJDxr8aI1Qj/fkvURD34O9awcplMssfoC
 PV9jVLr+OCIa2vgxz977f2kQ9RmnRAEFLifAxIy4KPsTxs3VuF8ECtzw86WX0fzwJpLS
 yfpZKBKXKXqcJFXxt5eWoY85IWvioR/JKfz+S67eofp1zNcBo77qc8T2yod4/diHRY9Y
 IlzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmFfip715Zo2ZYPzqIWXbVMI6fasAnm818J9ZJwks27NyVwEfHeDormR7Z+WSbht3vqyejPhwaUDi/@nongnu.org
X-Gm-Message-State: AOJu0YzmKVnEgpHXE7otvxEj5fskTS++vBfbjeRF4+FPVFJuE16V7uTF
 WNtU6eFaahkLWrmNCBPMqD8e51KMc2Xb5VvSmqxEVyDkG1OCLgC4c43orcnwuFAgVxE=
X-Gm-Gg: ASbGncvx9OOLkTt1eoqhNFxYSxND7Rqa/zsZEogTRRX9ZcRJ3wZK4VUmagngmzMAyLS
 LHyUPMBi8Rlj3wlWjwGI/Wk2zuXmVZcST6KWzDeLezct2bKUh7/Q9GQYYTFljL4hPdEC/lcCWBP
 7zblDL4AI03eoV1031U6B19/HUXZbAyoWugWwMV8Zl+LJtxGzbIqxy5+t1ykDYLkgUp2u4HdPIo
 av0Z5e+01mOqQtaGxWB1viw+aBzTx20FdkfIYJ55jjBJQFhHYviT890yjVir3zDBytbnB2Naodn
 glKeCFfx/c6U7PHaRJzgwAsva4Lo/tgZjJfGIr7sr1GlVRzlv0mJn0R9ndco6SiDL4RwpaUzBCe
 eEbNdFlKDy/+aKf+wobeOz5jAldhdEd3SVcYWEOxPxsiCrs4LKmKrhTo498wYCIN3h3pgut1XRq
 5MjCkF3emnGY0xOR/A+y+0cWPqxsrKx3SV6c29xkLBbxWg+Bh3uB/pdw==
X-Google-Smtp-Source: AGHT+IHKKU4ceMuaE95csztZcp8xaXOFHTU3Bea9HWqGWegeju5+IOQNhIe6zGPw+m52NYEXgQy3dg==
X-Received: by 2002:a05:6000:2dc3:b0:42b:2e94:5a8f with SMTP id
 ffacd0b85a97d-42e0f35913amr2072165f8f.52.1764066447520; 
 Tue, 25 Nov 2025 02:27:27 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3a81sm34239083f8f.26.2025.11.25.02.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 02:27:26 -0800 (PST)
Message-ID: <f34353af-ebe5-4a43-9982-385b4113c983@linaro.org>
Date: Tue, 25 Nov 2025 11:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] ui: Convert to qemu_create() for simplicity and
 consistency
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-4-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 21/11/25 13:14, Markus Armbruster wrote:
> The error message changes from
> 
>      failed to open file 'FILENAME': REASON
> 
> to
> 
>      Could not create 'FILENAME': REASON
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   ui/ui-qmp-cmds.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


