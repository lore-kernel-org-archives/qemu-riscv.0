Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D955C43327
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:41:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHfo-0003ae-1J; Thu, 02 Jul 2026 09:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wfHfm-0003ZA-L6
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:41:46 -0400
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wfHfl-0002uE-3K
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:41:46 -0400
Received: by mail-pj2-x03.google.com with SMTP id
 98e67ed59e1d1-37e15d4e2a7so424858a91.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782999703; x=1783604503; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rotkQl0CiDNdCAUi76CHdJlf5BWJzBqUM9PHD/wQaVk=;
 b=oSUDYtViI80bm4LKHWaRzEJTrhrczBMUa/Znju8qjA7xLoQqMwYheOyolrM+/Tnl8x
 oPM105O/nrBhsRiKxWSqWEQWvS2M3yMN2nT7hgFuvnWFZEBTyprm3ug+0npzYvw+rI7E
 EAp8LaaSipc3DNJHGWR2GsQgy6ir6TBTGk/OOsZcFZSazLpRsjuHoSodz5qiX1cQXeS7
 Ki/xGr4gZpTl9HVN5Zc8TEh5e1bCGQAoeTFcYK9YunRMZnPwdtVaw1Xh6/53HHl3eMkV
 MH0fFK9EIaL/EEt/FdhUw0y6D6/4cyHEw8XRUVv1tnCam/svqDWmVyetF24n15Ju6g/W
 1hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782999703; x=1783604503;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rotkQl0CiDNdCAUi76CHdJlf5BWJzBqUM9PHD/wQaVk=;
 b=DEVTurpU3PkO4EijMK9zf7NgWLxopmRhTxOow+H4tJ7bGrKdyiTQPIhdblzBV49Pgw
 x9urbkx2tWbtJPSnhKvFSNkko+/VAGv9E8vWjjuGT9PZXhb6e0HEv3wbTpHnOwwMk+yW
 LxyCaJCy24pBnbNj/+jLkD9Dp7o4PRU2oeEmcOcBViwzqupLJ6zu4LwyKEvkH7uixkDh
 9lQw3VMF2/qepeMJhPH50SwlQT1RNkQWLGt1OJSAHZ+tFljTlD5UXErWcWH1DEL0T5Ds
 /8/QuFxrmeGv8JbEGVJfeqjbynVLqgh9fW6R0xDlR8A3CT3Sx55Cx2dt+dHzwa8RExIh
 qK1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9KCjfCUdV0/FgdeIuwlnKCwlVz+wE7fBX1Ihux79bXPCoZ6+ItbKuB3lZw1IF9wgPQZhr0YF0nb9+c@nongnu.org
X-Gm-Message-State: AOJu0YwekqAHQl5RKoorYecr6cSaH8y95ijqBHGWY7/R9K8q1HOFM+oc
 aJAxHmrv0pIt6+1wMfGUetaQpKE3LATZvCLzyvMx5x0+nsbY0+nM/Clb
X-Gm-Gg: AfdE7cldo6aLIQ1gd5ftem6en0AmtV3njyQkm7RQdJdOiB35ARlQdaR6IYC07i7hz7W
 fxTbfi4NBvaGhOtuserLu9ipPCVA+dUfw1g1TrI8kPNVdEJIP+WWQgBpUIEboc1erBhxsTdIGZW
 37xoeipCj4Pm5C1xOPwprz8k7WtOz3tUqZef1GWAx6IfVhwNIAvFSlQVkYqh+QYfISkrLyPfNZj
 sT/3czvsR9HSzMvhNleqpPxaHCgndwGQEgQPjrfoetGwBwJng184fKmA+XRQqdccZ7l05e3QpOs
 U7u3igHhDqPdwZmuitxinTjW8JYYgncEqdADSfpBEKqeXLfs07gCSaBY3ASdV3DKWLBJRJCztRx
 PL4D6Z9MxG30XR/fnWn822RQqdT0YhnDzAbjmvfwbG78mmIKQpD+ayXHPrulZiI5mUO0TQyE6mb
 p0Vthw/FumOgHz5f/wvosgeAcOrrVWNuLk1GKi/U0pVMVz1JcmqRt4+UDO4+U=
X-Received: by 2002:a05:6a21:6f12:b0:3bf:7498:9cd1 with SMTP id
 adf61e73a8af0-3bff42b62a6mr6332890637.45.1782999703353; 
 Thu, 02 Jul 2026 06:41:43 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13b3c7ef728sm9401251c88.3.2026.07.02.06.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:41:42 -0700 (PDT)
Date: Thu, 2 Jul 2026 21:41:40 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 andrew.jones@oss.qualcomm.com, 
 leif.lindholm@oss.qualcomm.com, uwu@icenowy.me,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v8 1/7] target/riscv/cpu.c: remove 'bare' condition for
 .profile
Message-ID: <akZqi6dSMGa_0igp@ChaodeMacBook-Pro.local>
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
 <20260610214133.1882563-2-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610214133.1882563-2-daniel.barboza@oss.qualcomm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:39::3;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-pj2-x03.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, Jun 10, 2026 at 06:41:27PM +0800, Daniel Henrique Barboza wrote:
> We want to configure other CPU types to use profiles as an alternative
> to adding every profile extension explicitly, i.e. a profile is nothing
> more than an extension bundle.
> 
> This means that a vendor CPU can set .profile=rva23s64 while having the
> same handling as any other vendor CPU. Same thing with all other CPU
> types.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

> ---
>  target/riscv/cpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6423f2d548..e02d53cbba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2744,7 +2744,6 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
>          mcc->def->bare |= def->bare;
>          if (def->profile) {
>              assert(profile_extends(def->profile, mcc->def->profile));
> -            assert(mcc->def->bare);
>              mcc->def->profile = def->profile;
>          }
>          if (def->misa_mxl_max) {
> -- 
> 2.43.0
> 

