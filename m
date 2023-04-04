Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjapD-0000wS-CF
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 03:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pjapC-0000vQ-FE; Tue, 04 Apr 2023 03:11:26 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pjap8-0008RO-MH; Tue, 04 Apr 2023 03:11:26 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R731e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VfKiFxS_1680592269; 
Received: from 30.221.97.97(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VfKiFxS_1680592269) by smtp.aliyun-inc.com;
 Tue, 04 Apr 2023 15:11:09 +0800
Message-ID: <a2669beb-2bb5-32cd-c31b-2f5aaeee42c7@linux.alibaba.com>
Date: Tue, 4 Apr 2023 15:11:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 00/25] target/riscv: MSTATUS_SUM + cleanups
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <66a60213-0783-c929-5bbc-e012de2a4183@intel.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <66a60213-0783-c929-5bbc-e012de2a4183@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.118;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-118.freemail.mail.aliyun.com
X-Spam_score_int: -111
X-Spam_score: -11.2
X-Spam_bar: -----------
X-Spam_report: (-11.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.349, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 04 Apr 2023 07:11:27 -0000


On 2023/4/4 14:42, Wu, Fei wrote:
> On 3/25/2023 6:54 PM, Richard Henderson wrote:
>> This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.
>>
>>    * Reclaim 5 TB_FLAGS bits, since we nearly ran out.
>>
>>    * Using cpu_mmu_index(env, true) is insufficient to implement
>>      HLVX properly.  While that chooses the correct mmu_idx, it
>>      does not perform the read with execute permission.
>>      I add a new tcg interface to perform a read-for-execute with
>>      an arbitrary mmu_idx.  This is still not 100% compliant, but
>>      it's closer.
>>
>>    * Handle mstatus.MPV in cpu_mmu_index.
>>    * Use vsstatus.SUM when required for MMUIdx_S_SUM.
>>    * Cleanups for get_physical_address.
>>
>> While this passes check-avocado, I'm sure that's insufficient.
>> Please have a close look.
>>
> I tested stress-ng to get the feeling of performance gain, although
> stress-ng is not designed to be a performance workload. btw, I had to
> revert commit 0ee342256af9 which is unrelated to this series, or qemu
> exited during the test.
>      ./stress-ng --timeout 5 --metrics-brief --class os --sequential 1
>
> Here is the result, in general most of the tests benefit from these
> series, but please note that not all the results are necessary to be
> consistent across multiple runs, and some regressions are not real but I
> haven't checked it one by one.
>
>               master(60ca584b)   master + this      speedup
>
> stressor           bogo ops/s      bogo ops/s
>                 (usr+sys time)  (usr+sys time)
> sigsuspend            19430.09      1492746.34     76.8265
> utime                  8779.64       271023.89     30.8696
> chmod                  1728.26        27050.50     15.6519
> vdso               23527136.74    246955742.76     10.4966
> signal               584521.13      5470775.44     9.35941
> sigtrap              822935.76      7190973.63     8.7382
> signest              802706.93      6969509.05     8.68251
> sockpair             501188.08      4242275.08     8.46444
> msg                 1627863.38     13557215.89     8.32823
> sigpending           551174.68      4575836.91     8.30197
> locka               1447750.95     11727762.91     8.10068
> lockofd             1460020.77     11562178.66     7.91919
> sigsegv              718492.57      5673228.57     7.89602
> getrandom            129004.90      1006544.31     7.80237
> sigq                 892062.12      6828556.43     7.6548
> chdir                    13.39          100.66     7.51755
> timerfd             2074142.37     15395307.29     7.42249
> mq                   916620.00      6208148.59     6.77287
> mutex               1124306.59      7285459.79     6.47996
> urandom              104868.58       678510.46     6.4701
> pipe                2243935.71     14391093.39     6.41333
> loadavg              463874.30      2936816.17     6.33106
> fifo                 423415.43      2632734.32     6.21785
> vm                    16726.91        99928.62     5.97412
> handle               199246.08      1131172.45     5.67726
> fstat                  2383.12        13479.35     5.65618
> sigrt                405007.13      2143758.11     5.29314
> access                 8449.17        44145.10     5.22479
> sigfd               1506073.95      7408089.06     4.91881
> sysinfo               11711.47        54868.08     4.68499
> sigio               1672452.59      7564833.33     4.5232
> rlimit                26771.83       119476.12     4.46276
> xattr                   772.25         3412.81     4.41931
> udp                  595733.08      2495239.72     4.18852
> sockfd               260825.22      1061910.05     4.07135
> get                   13169.56        52788.06     4.00834
> getdent              141465.81       564471.43     3.99016
> rename                61771.74       246277.28     3.98689
> chown                 54946.74       212353.58     3.86472
> dev                    3555.80        13596.14     3.82365
> mincore                6617.92        25215.66     3.81021
> file-ioctl           105919.35       398122.29     3.75873
> link                     15.45           56.02     3.62589
> splice               239841.25       865390.06     3.60818
> io-uring              45798.90       157006.17     3.42816
> filename               7795.98        26238.75     3.36568
> sock                   1746.96         5850.73     3.34909
> vm-splice            953550.50      3188724.62     3.34405
> schedpolicy          231915.33       773655.76     3.33594
> clock                 21878.02        72400.21     3.30927
> fcntl                 76122.11       245817.92     3.22926
> dentry                79533.95       247610.80     3.11327
> fpunch                11895.30        36608.97     3.0776
> revio                866066.56      2596187.53     2.99768
> null                2351038.37      6984334.92     2.97074
> mknod                 71145.05       203284.26     2.85732
> symlink                  12.40           35.41     2.85565
> fiemap                45437.02       128983.69     2.83874
> sleep                100093.89       282540.81     2.82276
> dir                   99154.72       272727.21     2.75052
> timer                126419.44       344857.10     2.72788
> set                   70640.29       192423.96     2.724
> udp-flood            662581.75      1782759.62     2.69063
> ioprio                 7030.55        18807.67     2.67513
> epoll                147525.39       387861.58     2.62912
> vm-rw                  1437.12         3774.13     2.62618
> kill                 234075.90       613281.66     2.62001
> hdd                   99017.45       257841.08     2.604
> rtc                   57639.55       149363.61     2.59134
> dirmany              127249.90       323667.85     2.54356
> sem-sysv            1096787.78      2753588.88     2.51059
> close                194579.21       482854.54     2.48153
> dnotify               15125.16        37097.94     2.45273
> dccp                   7554.97        18429.65     2.43941
> lease                285588.09       692990.31     2.42654
> eventfd              282256.72       681576.60     2.41474
> sockdiag           14803911.93     34934756.45     2.35983
> memfd                  3632.45         8513.45     2.34372
> tee                  124239.86       290298.68     2.3366
> alarm                 78757.48       181210.40     2.30087
> poll                 128638.34       292293.31     2.27221
> open                 189323.41       418865.86     2.21244
> sigpipe              222534.69       486854.87     2.18777
> pty                      18.95           39.13     2.06491
> futex               1333749.78      2742935.07     2.05656
> lockf                648732.25      1321326.88     2.03678
> kcmp                 734152.03      1452613.12     1.97863
> procfs                 7378.58        14503.74     1.96565
> sockmany              94910.81       180132.46     1.89791
> dirdeep               10330.82        19390.08     1.87692
> touch                 97843.94       182585.97     1.86609
> chattr                 2952.98         5426.15     1.83752
> mmaphuge                430.84          738.17     1.71333
> sem                  649644.88      1107290.70     1.70446
> ptrace              1010862.41      1677555.44     1.65953
> vfork                244944.97       403514.39     1.64737
> nanosleep             23147.04        38097.83     1.64591
> mprotect            1068863.24      1729245.09     1.61784
> pipeherd             720787.08      1157261.92     1.60555
> pthread               48395.68        76169.49     1.57389
> enosys                 8271.11        12705.37     1.53611
> sockabuse              2825.44         4251.52     1.50473
> af-alg               620270.87       916118.93     1.47697
> fork                  10583.97        15363.15     1.45155
> copy-file              6675.07         9389.54     1.40666
> resched             1730236.55      2421449.49     1.39949
> msync                 93196.18       122263.64     1.3119
> vforkmany            239372.56       304313.41     1.2713
> vm-segv               11918.23        14981.24     1.257
> readahead            261489.55       321372.13     1.22901
> sendfile             147043.77       174971.03     1.18992
> dynlib                 8526.99        10078.23     1.18192
> fault                 86430.63       100320.47     1.16071
> dup                    9829.71        11264.11     1.14592
> full                 473749.38       541801.33     1.14365
> mmapaddr             315772.34       351766.42     1.11399
> spawn                  3937.57         4384.92     1.11361
> io                   371206.67       409205.80     1.10237
> munmap                64162.14        70473.66     1.09837
> exit-group             5990.95         6522.70     1.08876
> pidfd                 37614.16        40687.85     1.08172
> flock              14069057.61     15117799.43     1.07454
> wait                 106334.40       113658.40     1.06888
> mmapfork                  1.81            1.93     1.0663
> daemon              1161091.36      1234795.43     1.06348
> bigheap              185514.46       195279.13     1.05264
> mmapfixed               319.65          333.70     1.04395
> brk                 1410050.59      1456025.25     1.0326
> sigabrt               12129.51        12520.45     1.03223
> sysfs                   806.78          831.54     1.03069
> dev-shm                  40.30           41.37     1.02655
> bad-altstack           7310.53         7493.23     1.02499
> shm                     823.73          842.50     1.02279
> shm-sysv               1132.54         1151.86     1.01706
> mmapmany             400323.77       406078.50     1.01438
> session               12096.44        12228.64     1.01093
> madvise                 116.81          117.96     1.00985
> clone                 28152.35        28414.20     1.0093
> msyncmany              2220.25         2238.88     1.00839
> pageswap             205651.13       207367.84     1.00835
> unshare                 637.92          642.98     1.00793
> remap                   373.18          375.69     1.00673
> personality         1698012.68      1706642.92     1.00508
> reboot               117234.02       117421.91     1.0016
> itimer                24962.64        24971.19     1.00034
> sync-file                 0.00            0.00     1
> sigfpe                    0.00            0.00     1
> seek                      0.00            0.00     1
> inode-flags               0.00            0.00     1
> env                       0.00            0.00     1
> prctl                 11805.81        11772.73     0.997198
> malloc               991487.43       987061.41     0.995536
> mmap                     14.48           14.39     0.993785
> zombie                33753.24        33539.75     0.993675
> rmap                    625.84          620.94     0.992171
> tlb-shootdown           358.25          355.33     0.991849
> switch              1251701.93      1240818.57     0.991305
> zero                 127112.38       125254.50     0.985384
> resources               685.62          674.89     0.98435
> yield               4184626.17      4117860.34     0.984045
> mlock                494527.50       485733.90     0.982218
> fallocate             32711.39        32067.69     0.980322
> sigchld               46289.82        44914.65     0.970292
> inotify                3013.11         2879.87     0.95578
> opcode                11315.78        10538.58     0.931317
> nice                 154327.30       136797.63     0.886412
> mremap                  225.29          198.82     0.882507
> exec                   4118.89         3282.85     0.797023
> vm-addr                 214.25          166.69     0.778016
> landlock                950.00          722.74     0.760779

Thanks for testing. Have you analyzed the cases with worse performance? 
As we are doing a optimization.

Thanks,
Zhiwei

> Thanks,
> Fei.
>> r~
>>
>>
>> Fei Wu (2):
>>    target/riscv: Separate priv from mmu_idx
>>    target/riscv: Reduce overhead of MSTATUS_SUM change
>>
>> LIU Zhiwei (4):
>>    target/riscv: Extract virt enabled state from tb flags
>>    target/riscv: Add a general status enum for extensions
>>    target/riscv: Encode the FS and VS on a normal way for tb flags
>>    target/riscv: Add a tb flags field for vstart
>>
>> Richard Henderson (19):
>>    target/riscv: Remove mstatus_hs_{fs,vs} from tb_flags
>>    accel/tcg: Add cpu_ld*_code_mmu
>>    target/riscv: Use cpu_ld*_code_mmu for HLVX
>>    target/riscv: Handle HLV, HSV via helpers
>>    target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
>>    target/riscv: Introduce mmuidx_sum
>>    target/riscv: Introduce mmuidx_priv
>>    target/riscv: Introduce mmuidx_2stage
>>    target/riscv: Move hstatus.spvp check to check_access_hlsv
>>    target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
>>    target/riscv: Check SUM in the correct register
>>    target/riscv: Hoist second stage mode change to callers
>>    target/riscv: Hoist pbmte and hade out of the level loop
>>    target/riscv: Move leaf pte processing out of level loop
>>    target/riscv: Suppress pte update with is_debug
>>    target/riscv: Don't modify SUM with is_debug
>>    target/riscv: Merge checks for reserved pte flags
>>    target/riscv: Reorg access check in get_physical_address
>>    target/riscv: Reorg sum check in get_physical_address
>>
>>   include/exec/cpu_ldst.h                       |   9 +
>>   target/riscv/cpu.h                            |  47 ++-
>>   target/riscv/cpu_bits.h                       |  12 +-
>>   target/riscv/helper.h                         |  12 +-
>>   target/riscv/internals.h                      |  35 ++
>>   accel/tcg/cputlb.c                            |  48 +++
>>   accel/tcg/user-exec.c                         |  58 +++
>>   target/riscv/cpu.c                            |   2 +-
>>   target/riscv/cpu_helper.c                     | 393 +++++++++---------
>>   target/riscv/csr.c                            |  21 +-
>>   target/riscv/op_helper.c                      | 113 ++++-
>>   target/riscv/translate.c                      |  72 ++--
>>   .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
>>   target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
>>   target/riscv/insn_trans/trans_rvh.c.inc       | 135 +++---
>>   target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
>>   target/riscv/insn_trans/trans_xthead.c.inc    |   7 +-
>>   17 files changed, 595 insertions(+), 395 deletions(-)
>>

