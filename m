Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pV7YC-0000WZ-AH
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 04:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV7YA-0000WC-PI
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 04:06:02 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV7Y8-0001UB-TE
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 04:06:02 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l1so9760935wry.10
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 01:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XHU07NFC76FnPEy31HMMnE6DgiOJ7zJNC5+01Fwgdks=;
 b=TJRfSwWlMqYHMdr8ebFGJvLDSvTKGkfEpWznI3p/yImnJk0lJxLgtFBGzJUN+aHViu
 B1O/FDCEk88hLsbI6h0kcqnhP+hYPjImIWqJnE07PXFweOmY+7x5LOomexRcQ0IdE9Ak
 aA/ARYgTAs6iTM/uD20JLoMbOd7ew3tb0AXP8xkd/gJNgHmbEddS5w32KtckeCEoJ5qa
 I+rw5ufB6SNheqZ4qtXenyZjbppmrbOGCURg3A9giKkHiH2X+LuePBMV+PBacK/ksrU/
 mh307lDClscw+E3udM14taDQeQ8m6WXy0L6YRLA3eN5HvW1ET5ednPQvv3rcL767ZvW5
 KBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XHU07NFC76FnPEy31HMMnE6DgiOJ7zJNC5+01Fwgdks=;
 b=mhCJt0fk49RnUsbKki4jwuJ0TBg8Aqbcn5lslTjgtXakNE80LJh6uQGuFZ6bOjyegc
 g6200A6xwaho7WPC/RyuGRvUM5kGzvq0dbGO4cwVW2jXruw1N4EXzbhh2fIP4Ly4JNQd
 quCfjhGPgaucl36EYjbYL5JSrNmB/lsTSD89tnQia5Z+JulZa1wSijXkHclnvRMGI3z3
 89TXhlieemHi7cHhxQ+8y+OITFRv1w0NbbMZsPSk6uDStnwEGaz8vVEe+/Pgi/Zn5LqN
 bV9MRzs1yNvY2UYtgdXqjkoQMXaex8tnZwdPDGfCK6O9z4wHF4aPB7D1n/z+J0WykfVc
 Bg4A==
X-Gm-Message-State: AO0yUKXEINqy9UTx5AaZOz2JDfceQBx5ofjmtvpGRzGw+iNenu++l+2V
 inOn3bVpuOE/KSQENls89IrNcg==
X-Google-Smtp-Source: AK7set/Dc6KaklwA11OJXXVCThEKIyAP+HUZrXVQee88qTLt/xJl6ZnAhsMuJiW+lXZsRiv0523HNQ==
X-Received: by 2002:adf:f147:0:b0:2c5:c4c9:515a with SMTP id
 y7-20020adff147000000b002c5c4c9515amr10401654wro.51.1677143158160; 
 Thu, 23 Feb 2023 01:05:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a05600c475200b003e220998b6bsm12185152wmo.17.2023.02.23.01.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 01:05:57 -0800 (PST)
Message-ID: <1fd1606c-3dde-b780-14f7-d8a9ae4dedf5@linaro.org>
Date: Thu, 23 Feb 2023 10:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/4] numa: Validate socket and NUMA node boundary if
 required
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 yihyu@redhat.com, shan.gavin@gmail.com
References: <20230223081401.248835-1-gshan@redhat.com>
 <20230223081401.248835-3-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223081401.248835-3-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Feb 2023 09:06:03 -0000

On 23/2/23 09:13, Gavin Shan wrote:
> For some architectures like ARM64, multiple CPUs in one socket can't be
> associated with different NUMA nodes. Otherwise, the guest kernel is confused
> about the CPU topology. For example, the following warning message is observed
> from linux guest with the below command lines.
> 
>    -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
>    -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
>    -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
>    -numa node,nodeid=2,cpus=4-5,memdev=ram2                \
> 
>    ------------[ cut here ]------------
>    WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
>    Modules linked in:
>    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
>    pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    pc : build_sched_domains+0x284/0x910
>    lr : build_sched_domains+0x184/0x910
>    sp : ffff80000804bd50
>    x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
>    x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
>    x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
>    x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
>    x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
>    x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
>    x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
>    x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
>    x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
>    x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
>    Call trace:
>     build_sched_domains+0x284/0x910
>     sched_init_domains+0xac/0xe0
>     sched_init_smp+0x48/0xc8
>     kernel_init_freeable+0x140/0x1ac
>     kernel_init+0x28/0x140
>     ret_from_fork+0x10/0x20
> 
> Improve the sitation to reject the configuration where multiple CPUs

Typo "situation".

> in one socket have been associated with different NUMA nodes. The
> newly introduced helper set_numa_socket_boundary() is expected to
> called by specific machines (boards) where the boundary is required.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine.c     | 34 ++++++++++++++++++++++++++++++++++
>   hw/core/numa.c        |  7 +++++++
>   include/sysemu/numa.h |  4 ++++
>   3 files changed, 45 insertions(+)


> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 4173ef2afa..160008fff4 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -86,6 +86,9 @@ struct NumaState {
>       /* Detect if HMAT support is enabled. */
>       bool hmat_enabled;
>   
> +    /* CPUs in one socket can't break socket boundary */
> +    bool have_socket_boundary;

This field belong to MachineClass, please add it as
numa_have_socket_boundary just after to numa_mem_supported.

Next patches become:

---
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f778cb6d09..a48f1b2329 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -864,6 +864,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, 
void *data)
      mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
      mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
      mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
+    mc->numa_have_socket_boundary = true;
  }
---

Otherwise LGTM :)

